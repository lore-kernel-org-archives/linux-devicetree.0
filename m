Return-Path: <SRS0=0nt1=UZ=oracle.com=dan.carpenter@kernel.org>
Date: Wed, 26 Jun 2019 13:07:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] scripts/dtc: Update to upstream version
 v1.5.0-23-g87963ee20693
Message-ID: <20190626100727.GC3242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: robh@kernel.org
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello Rob Herring,

The patch 9bb9c6a110ea: "scripts/dtc: Update to upstream version
v1.5.0-23-g87963ee20693" from Jun 12, 2019, leads to the following
static checker warning:

	./scripts/dtc/libfdt/fdt_addresses.c:74 fdt_appendprop_addrrange()
	warn: integer overflow (literal): u32max + 1

./scripts/dtc/libfdt/fdt_addresses.c
    54  /* This function assumes that [address|size]_cells is 1 or 2 */
    55  int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
    56                               const char *name, uint64_t addr, uint64_t size)
    57  {
    58          int addr_cells, size_cells, ret;
    59          uint8_t data[sizeof(fdt64_t) * 2], *prop;
    60  
    61          ret = fdt_address_cells(fdt, parent);
    62          if (ret < 0)
    63                  return ret;
    64          addr_cells = ret;
    65  
    66          ret = fdt_size_cells(fdt, parent);
    67          if (ret < 0)
    68                  return ret;
    69          size_cells = ret;
    70  
    71          /* check validity of address */
    72          prop = data;
    73          if (addr_cells == 1) {
    74                  if ((addr > UINT32_MAX) || ((UINT32_MAX + 1 - addr) < size))
                                                     ^^^^^^^^^^^^^^
UINT32_MAX + 1 is just zero.

    75                          return -FDT_ERR_BADVALUE;
    76  
    77                  fdt32_st(prop, (uint32_t)addr);
    78          } else if (addr_cells == 2) {
    79                  fdt64_st(prop, addr);
    80          } else {
    81                  return -FDT_ERR_BADNCELLS;
    82          }
    83  
    84          /* check validity of size */
    85          prop += addr_cells * sizeof(fdt32_t);
    86          if (size_cells == 1) {
    87                  if (size > UINT32_MAX)
    88                          return -FDT_ERR_BADVALUE;
    89  
    90                  fdt32_st(prop, (uint32_t)size);
    91          } else if (size_cells == 2) {
    92                  fdt64_st(prop, size);
    93          } else {
    94                  return -FDT_ERR_BADNCELLS;
    95          }

regards,
dan carpenter
