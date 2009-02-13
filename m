From: ron minnich <rminnich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [coreboot] DTS syntax and DTC patches (was: Re: [Qemu-devel]
	[RFC] Machine description as data)
Date: Fri, 13 Feb 2009 09:07:08 -0800
Message-ID: <13426df10902130907m5c3452dpb8f4f2b72f8507b9__20430.6531967179$1234647755$gmane$org@mail.gmail.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
	<20090213004305.GB8104@yookeroo.seuss> <4994D6C8.5050004@gmx.net>
	<20090213021704.GA10476@yookeroo.seuss> <4994DED9.6020803@gmx.net>
	<20090213025101.GC10476@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000e0cd32e0af6862b0462cfdd43
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090213025101.GC10476-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>, Coreboot <coreboot-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, devicetree-d
List-Id: devicetree@vger.kernel.org

--000e0cd32e0af6862b0462cfdd43
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Here is the sum total of the differences from when we checked it in
over 2 years ago until now (parser). Our real changes are to
flattree.c and livetree.c, where we do some ugly by-hand parsing of
the ids such that pci@1,0 etc. work. I'd love to see a way to bring
this into the real syntax. I've tried to do as little as possible to
.y and .l.

The diff with comments is attached.

But this brings up a bigger issue and we could use your help.

OK, what did we do? We implemented the ability to have a sort of
template. Here is a sample from real use.

/{
	mainboard_vendor = "Artec";
	mainboard_name = "DBE62";
	cpus { };
	apic@0 {
		/config/("northbridge/amd/geodelx/apic");
	};
	domain@0 {
		/config/("northbridge/amd/geodelx/domain");
		pci@1,0 {
			/config/("northbridge/amd/geodelx/pci");
			/* Video RAM has to be in 2MB chunks. */
			geode_video_mb = "16";
		};
	etc.

so what's going on here?

The config file in most cases is pretty straightforward. It's actually
just a list of properties with a standard setting for chip control. We
MUST have this; we don't want hundreds of settings in each mainboard,
because sometimes a chip fix comes along and we want that to go into
one chip file, and set the correct value, and have all mainboards get
the new value next time they are built.

Let's look at /config/("northbridge/amd/geodelx/pci");

{
	device_operations = "geodelx_mc";

	/* Video RAM has to be in 2MB chunks. */
	geode_video_mb = "0";
};

The device_operations property is processed by flattree and is of no
importance to you, but it is used in coreboot .h and .c code
generation. For coreboot use, we have several property names that are
special.

Note that we create a property, geode_video_mb, and set it to 0.

In the mainboard dts, we over-ride this value, and set it to 16.

These are pretty much the changes and, again, they work. But I'd like
more, as would our community.

Right now, we can take a file containing a list of dts properties,
read them in, and modify them as above. It's not really ideal, and I
am sure you can already see it could be done better. But what we
really want is the ability to read in  a dts node (with subnodes,
etc.) and then elide them in the mainboard file.

So, for example, we have this subsection of one mainboard:

		pci@6{ /* Port 2 */
			/config/("southbridge/amd/rs690/pcie.dts");
		};
		pci@7{ /* Port 3 */
			/config/("southbridge/amd/rs690/pcie.dts");
		};
		pci@12{
			/config/("southbridge/amd/sb600/hda.dts");
		};
		pci@13,0{
			/config/("southbridge/amd/sb600/usb.dts");
		};
		pci@13,1{
			/config/("southbridge/amd/sb600/usb.dts");
		};
		pci@13,2{
			/config/("southbridge/amd/sb600/usb.dts");
		};

This is not a bunch of chips, but one chip. It has lots of pci devices
in it; this one chip is equivalent to a whole mainboard from previous
years. What we'd really like is the ability to do what my wife calls
restrict, add, and remove (I don't have these terms just right, it's
some kind of compiler-speak which is what she does for a living).

Restrict we have; change property values from a default.
Add is what we'd like: add a node to a tree in some way.
Remove we would also like: remove a node from a dts we have read in
via /config/.

Note that the syntax is only suggested here, the right way to do this
is up to you experts.

/{
	device_operations="dbm690t";
	mainboard_vendor = "AMD";
	mainboard_name = "dbm690t";
	cpus { };
	apic@0 {
	};
	domain@0 /config/("northbridge/amd/k8/domain") = {
                pci@1,0 /config/("southbridge/amd/sb600/dts") = {
                      /* change default xyz to "1" */
                      xyz = "1";
                      /* disable pcie port 6. Note this is over-riding
a value in a node. This is new. */
                     pcie@1,0{disable;};
                     /* don't even put port 7 in the tree -- what is a
remove going to look like?. Also new. */
                     - pcie@5,0;
                      /* add the superio; default values are
acceptable. Also new. We can't add nodes. */
                     pnp@2e /config/("superio/winbond/1234");
              };
       };
};

The result would be more compact files and easier maintenance.

I realize these changes may be too large for the dts to take on; there
is an ongoing discussion as to whether some other language might not
be more appropriate.

But, at the same time, people are comfortable with dts. They have
found it very comfortable to use.

I'd like to thank you for this excellent tool. It is being used to
build production BIOSes that are shipping in products as I write this.
It really saved us a lot of work on coreboot v3 and it is a much
better job, certainly, than I could have done myself.

Thanks, and I hope we can discuss this and work together.

ron

--000e0cd32e0af6862b0462cfdd43
Content-Type: application/octet-stream; name=dtcdiff
Content-Disposition: attachment; filename=dtcdiff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fr578tfi0

SW5kZXg6IGR0Yy1wYXJzZXIueQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBkdGMtcGFyc2VyLnkJKC4uLi9MaW51
eEJJT1N2My91dGlsL2R0Yy9kdGMtcGFyc2VyLnkpCShyZXZpc2lvbiAyKQorKysgZHRjLXBhcnNl
ci55CSguLi4vY29yZWJvb3QtdjMvdXRpbC9kdGMvZHRjLXBhcnNlci55KQkod29ya2luZyBjb3B5
KQpAQCAtMjMsNyArMjMsNiBAQAogCiAlewogI2luY2x1ZGUgImR0Yy5oIgotCiBpbnQgeXlsZXgg
KHZvaWQpOwogdm9pZCB5eWVycm9yIChjaGFyIGNvbnN0ICopOwogCkBAIC00Niw3ICs0NSw3IEBA
CiAJc3RydWN0IHJlc2VydmVfaW5mbyAqcmU7CiB9CiAKLSV0b2tlbiBEVF9NRU1SRVNFUlZFCisl
dG9rZW4gPHN0cj4gRFRfTUVNUkVTRVJWRQoKPj4+Pj4+Pj4+PldlIG1hZGUgdGhpcyBhIHN0cmlu
Zy4gSXQncyBuZXZlciBiZWVuIG9mIGFueSB1c2UgdG8gdXM7IHlvdSBtaWdodCBjb25zaWRlciB3
aGV0aGVyIHRoZSBjb25jZXB0IGlzIG9ic29sZXRlOyB3aGF0J3MgaXQgZm9yPwoKCiAldG9rZW4g
PGFkZHI+IERUX0FERFIKICV0b2tlbiA8c3RyPiBEVF9QUk9QTkFNRQogJXRva2VuIDxzdHI+IERU
X05PREVOQU1FCkBAIC01Niw2ICs1NSw4IEBACiAldG9rZW4gPHN0cj4gRFRfVU5JVAogJXRva2Vu
IDxzdHI+IERUX0xBQkVMCiAldG9rZW4gPHN0cj4gRFRfUkVGCisldG9rZW4gPHN0cj4gRFRfRklM
RU5BTUUKKyV0b2tlbiA8cHJvcGxpc3Q+IERUX0NPTkZJRwoKCldlIGltcGxlbWVudGVkIGEgInNv
cnQgb2YiIGluY2x1ZGUuIE1vcmUgaW4gdGhlIG5vdGUuIFlvdSBtYXkgbm90IGxpa2UgaXQsIHRo
ZSAubCBpcyBhbHNvIGF0dGFjaGVkLiBXZSBuZWVkZWQgdGhlc2UgdHdvIHRva2VucyBmb3IgaXQu
IAoKCiAKICV0eXBlIDxkYXRhPiBwcm9wZGF0YQogJXR5cGUgPHJlPiBtZW1yZXNlcnZlCkBAIC02
OCwxNCArNjksMTggQEAKICV0eXBlIDxub2RlPiBkZXZpY2V0cmVlCiAldHlwZSA8bm9kZT4gbm9k
ZWRlZgogJXR5cGUgPG5vZGU+IHN1Ym5vZGUKKyV0eXBlIDxwcm9wbGlzdD4gY29uZmlnCgpUaGlz
IGlzIGZvciBleHRlbnNpb25zL2NoYW5nZXMgdG8gdGhlIHByb3BlcnR5IGxpc3QuIE1vcmUgaW4g
dGhlIGVtYWlsLiAKCgogJXR5cGUgPG5vZGVsaXN0PiBzdWJub2RlcwogJXR5cGUgPHN0cj4gbGFi
ZWwKICV0eXBlIDxzdHI+IG5vZGVuYW1lCi0KKyV0eXBlIDxkYXRhPiBpbmNsdWRlcGF0aAorJXR5
cGUgPGRhdGE+IHN0cnVjdG5hbWUKICUlCiAKLXNvdXJjZWZpbGU6CW1lbXJlc2VydmVzIGRldmlj
ZXRyZWUgewotCQkJdGhlX2Jvb3RfaW5mbyA9IGJ1aWxkX2Jvb3RfaW5mbygkMSwgJDIpOworLypz
b3VyY2VmaWxlOgltZW1yZXNlcnZlcyBkZXZpY2V0cmVlIHsqLworc291cmNlZmlsZToJZGV2aWNl
dHJlZSB7CisvKgkJCXRoZV9ib290X2luZm8gPSBidWlsZF9ib290X2luZm8oJDEsICQyKTsqLwor
CQkJdGhlX2Jvb3RfaW5mbyA9IGJ1aWxkX2Jvb3RfaW5mbygwLCAkMSk7CiAJCX0KIAk7CiAKQEAg
LTEwMCw4ICsxMDUsOCBAQAogCQl9CiAJOwogCi1ub2RlZGVmOgkneycgcHJvcGxpc3Qgc3Vibm9k
ZXMgJ30nICc7JyB7Ci0JCQkkJCA9IGJ1aWxkX25vZGUoJDIsICQzKTsKK25vZGVkZWY6CSd7JyBj
b25maWcgcHJvcGxpc3Qgc3Vibm9kZXMgJ30nICc7JyB7CisJCQkkJCA9IGJ1aWxkX25vZGUoJDIs
ICQzLCAkNCk7CiAJCX0KIAk7CiAKQEAgLTExMyw2ICsxMTgsNDkgQEAKIAkJfQogCTsKIAorY29u
ZmlnOiAgICAgICAgRFRfQ09ORklHICcoJyAKKwkJaW5jbHVkZXBhdGggeworCQkJdm9pZCBzd2l0
Y2hpbihGSUxFICpmKTsKKwkJCUZJTEUgKmY7CisJCQkvKiBUaGUgbmVlZCBmb3IgYSBjYXN0IGhl
cmUgaXMgc2lsbHkgKi8KKwkJCWNoYXIgKm5hbWUgPSAoY2hhciAqKSQzLnZhbDsKKworCQkJLyog
VE9ETzoga2VlcCB0cmFjayBvZiB3aGljaCBvZiB0aGVzZSB3ZSBoYXZlIHJlYWQgaW4uIElmIHdl
IGhhdmUgYWxyZWFkeSBkb25lIGl0LCB0aGVuIAorCQkJICAqIGRvbid0IGRvIGl0IHR3aWNlLiAK
KwkJCSAgKi8KKwkJCWYgID0gZm9wZW5maWxlKG5hbWUpOworCQkJaWYgKCEgZil7CisJCQkJcGVy
cm9yKG5hbWUpOworCQkJCWV4aXQoMSk7CisJCQl9CisJCQlzd2l0Y2hpbihmKTsKKwkJfSAgJ3sn
IHByb3BsaXN0ICd9JyAnOycgeworCQkJdm9pZAlzd2l0Y2hiYWNrKHZvaWQpOworCQkJc3dpdGNo
YmFjaygpOworCQkJCisJCX0KKwkJJyknICc7JyB7CisJCQkJaW50IG5hbWVsZW47CisJCQkJY2hh
ciAqbmFtZSA9IHN0cmR1cCgoY2hhciAqKSQzLnZhbCk7CisJCQkJLyogY29udmVudGlvbjogZmly
c3QgcHJvcGVydHkgaXMgbGFiZWxlZCB3aXRoIHBhdGggKi8KKwkJCQkkNi0+bGFiZWwgPSBuYW1l
OworCisJCQkJLyogY29udmVudGlvbjogaWYgaXQgZW5kcyBpbiAuZHRzLCBzdHJpcCB0aGF0IG9m
ZgkqLworCQkJCW5hbWVsZW4gPSBzdHJsZW4oJDYtPmxhYmVsKTsKKwkJCQlpZiAoKG5hbWVsZW4g
PiA0KSAmJiAoISBzdHJuY21wKCZuYW1lW25hbWVsZW4tNF0sICIuZHRzIiwgNCkpKQorCQkJCQkk
Ni0+bGFiZWxbbmFtZWxlbi00XSA9ICdcMCc7CisKKwkJCQkkJCA9ICQ2OworCQkJfQorCXwKKwk7
CisKK2luY2x1ZGVwYXRoOglEVF9TVFJJTkcgIHsgJCQgPSAkMTsgfQorCTsKKworc3RydWN0bmFt
ZTogCURUX0ZJTEVOQU1FIHskJCA9ICQxOyB9CisJOworCgpUaGUgYWN0dWFsIGNvbmZpZyBjb21t
YW5kLiBXaGF0IGhhcHBlbnMgaGVyZSBpcyB0aGF0IGlmIHlvdSBoYXZlIGEgY29uZmlnLCB0aGUg
Y29uZmlnIHByb3BlcnRpZXMgYXJlIGF0dGFjaGVkIHRvIHRyZWUtPmNvbmZpZy4gCgppbiBmbGF0
dHJlZS5jIHdlIHJlc29sdmUgdGhlIHByb3BlcnR5IG5hbWVzLiBNb3JlIGluIHRoZSBtYWlsLiAK
CgoKIHByb3BkZWY6CWxhYmVsIERUX1BST1BOQU1FICc9JyBwcm9wZGF0YSAnOycgewogCQkJJCQg
PSBidWlsZF9wcm9wZXJ0eSgkMiwgJDQsICQxKTsKIAkJfQo=
--000e0cd32e0af6862b0462cfdd43
Content-Type: application/octet-stream; name="dtc-diff.l"
Content-Disposition: attachment; filename="dtc-diff.l"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fr5797ck1

SW5kZXg6IGR0Yy1sZXhlci5sCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGR0Yy1sZXhlci5sCSguLi4vTGludXhC
SU9TdjMvdXRpbC9kdGMvZHRjLWxleGVyLmwpCShyZXZpc2lvbiAyKQorKysgZHRjLWxleGVyLmwJ
KC4uLi9jb3JlYm9vdC12My91dGlsL2R0Yy9kdGMtbGV4ZXIubCkJKHdvcmtpbmcgY29weSkKQEAg
LTIzLDYgKzIzLDcgQEAKICV4IENFTExEQVRBCiAleCBCWVRFU1RSSU5HCiAleCBNRU1SRVNFUlZF
CisleCBQQVNTVEhST1VHSAogCiBQUk9QQ0hBUglbYS16QS1aMC05LC5fKyojPy1dCiBVTklUQ0hB
UglbMC05YS1mLF0KQEAgLTM1LDE2ICszNiwzMyBAQAogCiAjaW5jbHVkZSAiZHRjLXBhcnNlci50
YWIuaCIKIAotLyojZGVmaW5lIExFWERFQlVHCTEqLwotCiAjaWZkZWYgTEVYREVCVUcKICNkZWZp
bmUgRFBSSU5UKGZtdCwgLi4uKQlmcHJpbnRmKHN0ZGVyciwgZm10LCAjI19fVkFfQVJHU19fKQog
I2Vsc2UKICNkZWZpbmUgRFBSSU5UKGZtdCwgLi4uKQlkbyB7IH0gd2hpbGUgKDApCiAjZW5kaWYK
IAorY2hhciAqY29kZSA9IDA7CiAKK1lZX0JVRkZFUl9TVEFURSBic3RhY2sgPSBOVUxMOworaW50
IGxpbmU7CiAKK3ZvaWQKK3N3aXRjaGluKEZJTEUgKmYpeworCVlZX0JVRkZFUl9TVEFURSBiOwor
CWJzdGFjayA9IFlZX0NVUlJFTlRfQlVGRkVSOworCWIgPSB5eV9jcmVhdGVfYnVmZmVyKGYsIDgx
OTIpOworCWxpbmUgPSB5eWxpbmVubzsKKwl5eWxpbmVubyA9IDE7CisJeXlfc3dpdGNoX3RvX2J1
ZmZlcihiKTsKKwkKK30KKwordm9pZAorc3dpdGNoYmFjayh2b2lkKXsKKwkJeXlfc3dpdGNoX3Rv
X2J1ZmZlcihic3RhY2spOworCQl5eWxpbmVubyA9IGxpbmU7Cit9CgoKVGhpcyBpcyBmb3Igc3dp
dGNoaW5nIGlucHV0IHZpYSAvY29uZmlnLygiZmlsZW5hbWUiKTsKCiAlfQogCiAlJQpAQCAtNTgs
NiArNzYsMjIgQEAKIAkJCXJldHVybiBEVF9TVFJJTkc7CiAJCX0KIAorXiUlXG4JeworCQkJRFBS
SU5UKCJCZWdpbiBwYXNzdGhyb3VnaFxuIik7CisJCQkvKiBsZXQncyBiZSBzdHVwaWQuIDEgTUIg
aXMgd2F5IG1vcmUgdGhhbiBlbm91Z2ggLi4uICovCisJCQljb2RlID0gbWFsbG9jKDEwNDg1NzYp
OworCQkJKmNvZGUgPSAwOworCQkJQkVHSU4oUEFTU1RIUk9VR0gpOworCQl9CisKKzxQQVNTVEhS
T1VHSD4uKgl7CisJCQkJCURQUklOVCgiTWF0Y2hpbmcgaW4gcGFzc3Rocm91Z2ggJXNcbiIsIHl5
dGV4dCk7CisJCQkJCS8qIHlvdSB0ZWxsIG1lIHdoeSBlY2hvIGRvZXMgbm90IHdvcmsgKi8KKwkJ
CQkJLypFQ0hPOyovCisJCQkJCXN0cmNhdChjb2RlLCB5eXRleHQpOworCQkJCQlzdHJjYXQoY29k
ZSwgIlxuIik7CisJCQkJfQorCkFGQUlLIHRoZSBwYXNzdGhyb3VnaCBzdHVmZiBpcyBkZWFkIGFu
ZCBubyBsb25nZXIgdXNlZC4gVGhpcyB3b3VsZCBiZSByZW1vdmVkLiAKCiAiL21lbXJlc2VydmUv
Igl7CiAJCQl5eWxsb2MuZmlyc3RfbGluZSA9IHl5bGluZW5vOwogCQkJRFBSSU5UKCJLZXl3b3Jk
OiAvbWVtcmVzZXJ2ZS9cbiIpOwpAQCAtNjcsNyArMTAxLDcgQEAKIAogPE1FTVJFU0VSVkU+WzAt
OWEtZkEtRl0rIHsKIAkJCXl5bGxvYy5maXJzdF9saW5lID0geXlsaW5lbm87Ci0JCQlpZiAoeXls
ZW5nID4gMipzaXplb2YoeXlsdmFsLmFkZHIpKSB7CisJCQlpZiAoKHVuc2lnbmVkIGxvbmcpeXls
ZW5nID4gMipzaXplb2YoeXlsdmFsLmFkZHIpKSB7CiAJCQkJZnByaW50ZihzdGRlcnIsICJBZGRy
ZXNzIHZhbHVlICVzIHRvbyBsYXJnZVxuIiwKIAkJCQkJeXl0ZXh0KTsKIAkJCX0KQEAgLTg0LDkg
KzExOCwxNSBAQAogCQkJcmV0dXJuICc7JzsKIAkJfQogCisiL2NvbmZpZy8iCXsKKwkJCXl5bGxv
Yy5maXJzdF9saW5lID0geXlsaW5lbm87CisJCQlEUFJJTlQoIktleXdvcmQ6IC9jb25maWcvXG4i
KTsKKwkJCXJldHVybiBEVF9DT05GSUc7CisJCX0KKwoKaW1wbGVtZW50cyBEVF9DT05GSUcgCiA8
Q0VMTERBVEE+WzAtOWEtZkEtRl0rCXsKIAkJCXl5bGxvYy5maXJzdF9saW5lID0geXlsaW5lbm87
Ci0JCQlpZiAoeXlsZW5nID4gMipzaXplb2YoeXlsdmFsLmN2YWwpKSB7CisJCQlpZiAoKHVuc2ln
bmVkIGxvbmcpeXlsZW5nID4gMipzaXplb2YoeXlsdmFsLmN2YWwpKSB7CiAJCQkJZnByaW50Zihz
dGRlcnIsCiAJCQkJCSJDZWxsIHZhbHVlICVzIHRvbyBsb25nXG4iLCB5eXRleHQpOwogCQkJfQo=
--000e0cd32e0af6862b0462cfdd43
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--000e0cd32e0af6862b0462cfdd43--
