From: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: dt confusion, for_each_matching_node...
Date: Tue, 26 Jul 2011 22:15:56 +0200
Message-ID: <CA+03iojnhNU7ksPR=GBYgHo10juXXOTWcnxYH0F9h3kTtHSZzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6047621705298868696=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============6047621705298868696==
Content-Type: multipart/alternative; boundary=bcaec544ead66f6c4d04a8fe996e

--bcaec544ead66f6c4d04a8fe996e
Content-Type: text/plain; charset=ISO-8859-1

Hi Grant.

I am afraid I am seriously confused about how the dt is supposed to work.
Maybe I simply lack a detail, if I am lucky... perhaps it is to late in the
day...

Problem:
I cannot get the for_each_matching_node macro to give me anything, so the I
guess the of_find_matching_node cannot find anything.
I am using the uarts in the test code. With the test code below the snowball
dies.
Anyone see my mistake?

Thanks for any and all input.
/Niklas.

Suggestion: I forgot some initialization somewhere?

In this device tree I have:

/ {
        model = "ST-Ericsson Snowball";
        compatible = "snowball";
        #address-cells = <1>;
        #size-cells = <1>;

        #chosen {
                bootargs = "root=/dev/ram0 console=ttyAMA2,115200n8 debug
earlyprintk";
        };

        #memory {
                reg = <0x90000000 0x20000000>;
        };

        #soc-u8500 {
                address-cells = <1>;
                size-cells = <1>;
                compatible = "simple-bus";
                periph1-base = <0x32000>;

                cpus {
                        #address-cells = <1>;
                        #size-cells = <0>;
                        cpu@0 {
                                compatible = "arm,cortex-a9";
                                reg = <0>;
                        };
                        cpu@1 {
                                compatible = "arm,cortex-a9";
                                reg = <1>;
                        };
                };
        };

        uart@80120000 {
                compatible = "arm,pl011";
        };
        uart@80121000 {
                compatible = "arm,pl011";
        };
        uart@80007000 {
                compatible = "arm,pl011";
        };
  };


Test code:

static const struct of_device_id snowball_uarts[] __initconst={
        {.compatible="arm,pl011"},
        {},
};

static void __init mop500_uart_init_dt(void)
{
        struct device_node *node;
        u32 p0;
        int ret;

        /* Get device info from device-tree */
        for_each_matching_node(node, snowball_uarts) {
                goto doit;  /* Got something, all ok */
        }
        goto die;

 doit:
        /* Standard init, no dt */
        db8500_add_uart0(&uart0_plat);
        db8500_add_uart1(&uart1_plat);
        db8500_add_uart2(&uart2_plat);
die:
        ;
};

--bcaec544ead66f6c4d04a8fe996e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: base64

SGkgR3JhbnQuPGJyPjxicj5JIGFtIGFmcmFpZCBJIGFtIHNlcmlvdXNseSBjb25mdXNlZCBhYm91
dCBob3cgdGhlIGR0IGlzIHN1cHBvc2VkIHRvIHdvcmsuPGJyPk1heWJlIEkgc2ltcGx5IGxhY2sg
YSBkZXRhaWwsIGlmIEkgYW0gbHVja3kuLi4gcGVyaGFwcyBpdCBpcyB0byBsYXRlIGluIHRoZSBk
YXkuLi48YnI+PGJyPlByb2JsZW06PGJyPkkgY2Fubm90IGdldCB0aGUgZm9yX2VhY2hfbWF0Y2hp
bmdfbm9kZSBtYWNybyB0byBnaXZlIG1lIGFueXRoaW5nLCBzbyB0aGUgSSBndWVzcyB0aGUgb2Zf
ZmluZF9tYXRjaGluZ19ub2RlIGNhbm5vdCBmaW5kIGFueXRoaW5nLjxicj4KCkkgYW0gdXNpbmcg
dGhlIHVhcnRzIGluIHRoZSB0ZXN0IGNvZGUuIFdpdGggdGhlIHRlc3QgY29kZSBiZWxvdyB0aGUg
c25vd2JhbGwgZGllcy48YnI+QW55b25lIHNlZSBteSBtaXN0YWtlPzxicj48YnI+VGhhbmtzIGZv
ciBhbnkgYW5kIGFsbCBpbnB1dC48YnI+L05pa2xhcy48YnI+PGJyPlN1Z2dlc3Rpb246IEkgZm9y
Z290IHNvbWUgaW5pdGlhbGl6YXRpb24gc29tZXdoZXJlPzxicj4KPGJyPkluIHRoaXMgZGV2aWNl
IHRyZWUgSSBoYXZlOjxicj48YnI+LyB7PGJyPqCgoKCgoKAgbW9kZWwgPSAmcXVvdDtTVC1Fcmlj
c3NvbiBTbm93YmFsbCZxdW90Ozs8YnI+CqCgoKCgoKAgY29tcGF0aWJsZSA9ICZxdW90O3Nub3di
YWxsJnF1b3Q7Ozxicj6goKCgoKCgICNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj6goKCg
oKCgICNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj48YnI+oKCgoKCgoCAjY2hvc2VuIHs8YnI+
oKCgoKCgoKCgoKCgoKCgIGJvb3RhcmdzID0gJnF1b3Q7cm9vdD0vZGV2L3JhbTAgY29uc29sZT10
dHlBTUEyLDExNTIwMG44IGRlYnVnIGVhcmx5cHJpbnRrJnF1b3Q7Ozxicj4KCqCgoKCgoKAgfTs8
YnI+PGJyPqCgoKCgoKAgI21lbW9yeSB7PGJyPqCgoKCgoKCgoKCgoKCgoCByZWcgPSAmbHQ7MHg5
MDAwMDAwMCAweDIwMDAwMDAwJmd0Ozs8YnI+oKCgoKCgoCB9Ozxicj48YnI+oKCgoKCgoCAjc29j
LXU4NTAwIHs8YnI+oKCgoKCgoKCgoKCgoKCgIGFkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJy
PqCgoKCgoKCgoKCgoKCgoCBzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4KCqCgoKCgoKCgoKCg
oKCgoCBjb21wYXRpYmxlID0gJnF1b3Q7c2ltcGxlLWJ1cyZxdW90Ozs8YnI+oKCgoKCgoKCgoKCg
oKCgIHBlcmlwaDEtYmFzZSA9ICZsdDsweDMyMDAwJmd0Ozs8YnI+PGJyPqCgoKCgoKCgoKCgoKCg
oCBjcHVzIHs8YnI+oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKAgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7
MSZndDs7PGJyPqCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgICNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7
Ozxicj4KCqCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIGNwdUAwIHs8YnI+oKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoCBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLGNvcnRleC1hOSZxdW90Ozs8
YnI+oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoCByZWcgPSAmbHQ7MCZndDs7PGJyPqCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgIH07PGJyPqCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIGNwdUAx
IHs8YnI+CgqgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIGNvbXBhdGlibGUgPSAmcXVv
dDthcm0sY29ydGV4LWE5JnF1b3Q7Ozxicj6goKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
IHJlZyA9ICZsdDsxJmd0Ozs8YnI+oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKAgfTs8YnI+oKCgoKCg
oKCgoKCgoKCgIH07PGJyPqCgoKCgoKAgfTs8YnI+PGJyPqCgoKCgoKAgdWFydEA4MDEyMDAwMCB7
PGJyPgoKoKCgoKCgoKCgoKCgoKCgIGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwwMTEmcXVvdDs7
PGJyPqCgoKCgoKAgfTs8YnI+oKCgoKCgoCB1YXJ0QDgwMTIxMDAwIHs8YnI+oKCgoKCgoKCgoKCg
oKCgIGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwwMTEmcXVvdDs7PGJyPqCgoKCgoKAgfTs8YnI+
oKCgoKCgoCB1YXJ0QDgwMDA3MDAwIHs8YnI+oKCgoKCgoKCgoKCgoKCgIGNvbXBhdGlibGUgPSAm
cXVvdDthcm0scGwwMTEmcXVvdDs7PGJyPgoKoKCgoKCgoCB9Ozxicj6gIH07PGJyPjxicj48YnI+
VGVzdCBjb2RlOjxicj48YnI+c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc25vd2Jh
bGxfdWFydHNbXSBfX2luaXRjb25zdD17PGJyPqCgoKCgoKAgey5jb21wYXRpYmxlPSZxdW90O2Fy
bSxwbDAxMSZxdW90O30sPGJyPqCgoKCgoKAge30sPGJyPn07PGJyPjxicj4Kc3RhdGljIHZvaWQg
X19pbml0IG1vcDUwMF91YXJ0X2luaXRfZHQodm9pZCk8YnI+Cns8YnI+CqCgoKCgoKAgc3RydWN0
IGRldmljZV9ub2RlICpub2RlOzxicj4KoKCgoKCgoCB1MzIgcDA7PGJyPgqgoKCgoKCgIGludCBy
ZXQ7PGJyPgo8YnI+CqCgoKCgoKAgLyogR2V0IGRldmljZSBpbmZvIGZyb20gZGV2aWNlLXRyZWUg
Ki88YnI+CqCgoKCgoKAgZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZShub2RlLCBzbm93YmFsbF91YXJ0
cykgezxicj4KoKCgoKCgoKCgoKCgoKCgIGdvdG8gZG9pdDugIC8qIEdvdCBzb21ldGhpbmcsIGFs
bCBvayAqLzxicj6goKCgoKCgIH08YnI+CqCgoKCgoKAgZ290byBkaWU7PGJyPjxicj4KoGRvaXQ6
PGJyPgqgoKCgoKCgIC8qIFN0YW5kYXJkIGluaXQsIG5vIGR0ICovPGJyPgqgoKCgoKCgIGRiODUw
MF9hZGRfdWFydDAoJmFtcDt1YXJ0MF9wbGF0KTs8YnI+CqCgoKCgoKAgZGI4NTAwX2FkZF91YXJ0
MSgmYW1wO3VhcnQxX3BsYXQpOzxicj4KoKCgoKCgoCBkYjg1MDBfYWRkX3VhcnQyKCZhbXA7dWFy
dDJfcGxhdCk7PGJyPgpkaWU6PGJyPgqgoKCgoKCgIDs8YnI+Cn07PGJyPgo8YnI+PGJyPgo=
--bcaec544ead66f6c4d04a8fe996e--

--===============6047621705298868696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6047621705298868696==--
