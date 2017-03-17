From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Mark property::value as const
Date: Fri, 17 Mar 2017 17:17:15 +0800
Message-ID: <201703171613.IWm6RSo1%fengguang.wu@intel.com>
References: <148951941955.30407.4217812594792852642@sboyd-linaro>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <148951941955.30407.4217812594792852642@sboyd-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

[auto build test ERROR on linus/master]
[also build test ERROR on v4.11-rc2 next-20170310]
[cannot apply to glikely/devicetree/next]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Stephen-Boyd/of-Mark-property-value-as-const/20170317-143414
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
reproduce:
        wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=powerpc 

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/pci_32.c: In function 'pcibios_make_OF_bus_map':
>> arch/powerpc/kernel/pci_32.c:141:10: error: passing argument 1 of 'memcpy' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
      memcpy(map_prop->value, pci_to_OF_bus_map, pci_bus_count);
             ^~~~~~~~
   In file included from include/linux/string.h:18:0,
                    from include/uapi/linux/uuid.h:21,
                    from include/linux/uuid.h:19,
                    from include/linux/mod_devicetable.h:12,
                    from include/linux/pci.h:20,
                    from arch/powerpc/kernel/pci_32.c:6:
   arch/powerpc/include/asm/string.h:21:15: note: expected 'void *' but argument is of type 'const void *'
    extern void * memcpy(void *,const void *,__kernel_size_t);
                  ^~~~~~
   cc1: all warnings being treated as errors

vim +141 arch/powerpc/kernel/pci_32.c

e05b3b4a Paul Mackerras   2006-01-15  125  	 */
e05b3b4a Paul Mackerras   2006-01-15  126  	for (i=0; i<pci_bus_count; i++)
e05b3b4a Paul Mackerras   2006-01-15  127  		pci_to_OF_bus_map[i] = 0xff;
e05b3b4a Paul Mackerras   2006-01-15  128  
e05b3b4a Paul Mackerras   2006-01-15  129  	/* For each hose, we begin searching bridges */
a4c9e328 Kumar Gala       2007-06-27  130  	list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
44ef3390 Stephen Rothwell 2007-12-10  131  		struct device_node* node = hose->dn;
44ef3390 Stephen Rothwell 2007-12-10  132  
e05b3b4a Paul Mackerras   2006-01-15  133  		if (!node)
e05b3b4a Paul Mackerras   2006-01-15  134  			continue;
e05b3b4a Paul Mackerras   2006-01-15  135  		make_one_node_map(node, hose->first_busno);
e05b3b4a Paul Mackerras   2006-01-15  136  	}
8c8dc322 Stephen Rothwell 2007-04-24  137  	dn = of_find_node_by_path("/");
8c8dc322 Stephen Rothwell 2007-04-24  138  	map_prop = of_find_property(dn, "pci-OF-bus-map", NULL);
a7f67bdf Jeremy Kerr      2006-07-12  139  	if (map_prop) {
a7f67bdf Jeremy Kerr      2006-07-12  140  		BUG_ON(pci_bus_count > map_prop->length);
a7f67bdf Jeremy Kerr      2006-07-12 @141  		memcpy(map_prop->value, pci_to_OF_bus_map, pci_bus_count);
a7f67bdf Jeremy Kerr      2006-07-12  142  	}
8c8dc322 Stephen Rothwell 2007-04-24  143  	of_node_put(dn);
e05b3b4a Paul Mackerras   2006-01-15  144  #ifdef DEBUG
e05b3b4a Paul Mackerras   2006-01-15  145  	printk("PCI->OF bus map:\n");
e05b3b4a Paul Mackerras   2006-01-15  146  	for (i=0; i<pci_bus_count; i++) {
e05b3b4a Paul Mackerras   2006-01-15  147  		if (pci_to_OF_bus_map[i] == 0xff)
e05b3b4a Paul Mackerras   2006-01-15  148  			continue;
e05b3b4a Paul Mackerras   2006-01-15  149  		printk("%d -> %d\n", i, pci_to_OF_bus_map[i]);

:::::: The code at line 141 was first introduced by commit
:::::: a7f67bdf2c9f24509b8e81e0f35573b611987c80 [POWERPC] Constify & voidify get_property()

:::::: TO: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
:::::: CC: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--tKW2IUtsqtDRztdT
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
kcr+AB9VS2r7VQAA

--tKW2IUtsqtDRztdT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
