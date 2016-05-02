From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: dts: vfxxx: Add device tree node for OCOTP
Date: Mon, 02 May 2016 09:31:12 +0200
Message-ID: <4759698.elnRBldlxl@wuerfel>
References: <cover.1462171989.git.maitysanchayan@gmail.com> <b5c1ff5a805eae3e53f07f8d0161f0af51586c00.1462171990.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2044823.FFskJ8g9q3"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b5c1ff5a805eae3e53f07f8d0161f0af51586c00.1462171990.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart2044823.FFskJ8g9q3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 May 2016 12:35:01 Sanchayan Maity wrote:
> +                       ocotp@400a5000 {
> +                               compatible = "fsl,vf610-ocotp";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0x400a5000 0xCF0>;
> +                               clocks = <&clks VF610_CLK_OCOTP>;
> +
> +                               ocotp_cfg0: cfg0@410 {
> +                                       reg = <0x410 0x4>;
> +                               };
> +
> +                               ocotp_cfg1: cfg1@420 {
> +                                       reg = <0x420 0x4>;
> +                               };
> +                       };

How do the registers of the child nodes relate to the registers of the
parent? If there are in the same address space, it might be good to
add a "ranges" property to describe it.

	Arnd
--nextPart2044823.FFskJ8g9q3
Content-Type: message/rfc822
Content-Disposition: inline; filename="forwarded message"
Content-Description: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>: Re: [PATCH v8 40/45] drivers/of: Split unflatten_dt_node()

Return-Path: <linuxppc-dev-bounces+arnd=arndb.de-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Received: from lists.ozlabs.org ([103.22.144.68]) by mx.kundenserver.de (mxeue108) with ESMTPS (Nemesis) id 0Le2YC-1bSlPC0N1Y-00pra1 for <arnd-r2nGTMty4D4@public.gmane.org>; Mon, 02 May 2016 04:04:11 +0200
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3]) by lists.ozlabs.org (Postfix) with ESMTP id 3qynfW6MdWzDqFS for <arnd-r2nGTMty4D4@public.gmane.org>; Mon,  2 May 2016 12:04:03 +1000 (AEST)
X-Original-To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Delivered-To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148]) (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits)) (No client certificate requested) by lists.ozlabs.org (Postfix) with ESMTPS id 3qynfL3bw9zDq5g for <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>; Mon,  2 May 2016 12:03:54 +1000 (AEST)
Received: from localhost by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted for <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org> from <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>; Mon, 2 May 2016 12:03:52 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214) by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted; Mon, 2 May 2016 12:03:49 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
X-IBM-RcptTo: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77]) by d23dlp03.au.ibm.com (Postfix) with ESMTP id 478CA3578052 for <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>; Mon,  2 May 2016 12:03:49 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96]) by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id u4223fxi31195382 for <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>; Mon, 2 May 2016 12:03:49 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1]) by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id u4223FQ6018039 for <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>; Mon, 2 May 2016 12:03:17 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14]) by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id u4223Fu9017435; Mon, 2 May 2016 12:03:15 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114]) by ozlabs.au.ibm.com (Postfix) with ESMTP id 81CECA01E6; Mon,  2 May 2016 12:02:21 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199]) by bran.ozlabs.ibm.com (Postfix) with ESMTP id 752BFE3A40; Mon,  2 May 2016 12:02:21 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000) id 5B05C941E19; Mon,  2 May 2016 12:02:21 +1000 (AEST)
Date: Mon, 02 May 2016 12:02:21 +1000
From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 40/45] drivers/of: Split unflatten_dt_node()
Message-ID: <20160502020221.GA16612@gwshan>
References: <1455680668-23298-1-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> <1455680668-23298-41-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> <CAL_Jsq++L-D=RD6ZYK=CPnhqcZbhEbxsKk3xT-vK2R=Qe9Z_pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq++L-D=RD6ZYK=CPnhqcZbhEbxsKk3xT-vK2R=Qe9Z_pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050202-0021-0000-0000-0000096713E5
X-BeenThere: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>, <mailto:linuxppc-dev-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:linuxppc-dev-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>, <mailto:linuxppc-dev-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Reply-To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linuxppc-dev-bounces+arnd=arndb.de-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: Linuxppc-dev <linuxppc-dev-bounces+arnd=arndb.de-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Envelope-To: <arnd-r2nGTMty4D4@public.gmane.org>
X-UI-Filterresults: notjunk:1;V01:K0:pLyJe7UbbFU=:sxnZW6gLzHGGh+RQHigDXuEfpA JunFhgfOgCI14uaz/8DJQOAEG4q9RPrHpu1U7+NmBwR1LIp0rAR8M4Qpv7WNemFoIzjAFHJIl B8Prtx35cwrA+TzniwqDskZXW+L3aJo+2UIR1qmtJJGPoqrHDduZ4az7SokxPKYy896KohZkG SHOO8pVI4f+cnVSTzNHJhWCDMnIYcwVVlnfu3DNY2Jn+rspiZLe42zZ3csP+T7sKfDUhaM0bR vZC0nnniullxQSGHsXmRyUa3mZCTaxAHnFnXhUfIeHh7VBAjV1PcysI+R+ERN2yLshySAgOJ7 OLHT1XRy6sh6q5gpqnBdTYAtYDBq4VG77478siEkwnm55oeERcFISQa2nZbom47kdjll1Vo+V 9tu6L3JkZyopVadWc03VzkCjMBDWMUteWF2gfJ/cGrlf7XipLywdBtlLD+nHvMOXYpR9uHSv3 CFclSwYOmceTQ3UiNt9CQc8E4js0TVuxqtDUXklK/sBdLeGNsE1fqZdpI2R3o+4/+VlZqEOuk cHePX4eHQ5SD9Ganpt3Succ06OHj0gW0BCwJB+is40QQQAXqrB0Eqd9VU7s9xYKCoIMmiNRwa eCFY2p4gEubQZOI+QCWuuOhXRqPIyU/5tczL5r//XhB3pDHzWtLLCrQGd4Pg5+M49fsyEQx8g 4ezrkCFbmB5hsZGRKXQbt6ofUSz5yi3qJ+0WJ3Fo4tDTakTAHuZlhM26G
 6DHnuvpbfKhAWxTd lhC+QpFaHB46dvtbDH9f0Hda5D/dX/DwuSBRSQF4/WTXxzWSwZ83oaoiSv1hJhofzeq291mK3 pyMqD6NTYBxuWihKkaOgMaj9nPAEfBwMGMOU4yy45JHCmtl7scMI9XoTxI8jIK5PVahhrJfUo dZzFHSPCMyAXeekJdi+zPV21nGsvw3xJ98TLatnPh31E5WDSnL3iuV9faWWBzZJtx3mRQbyUC 6l3fL+9AHur2ZE6O5rIXklVamBLzxPwIhukQvYmz8NNlvgkbpX8ChcECaRb8DcPuql5f1NN46 0CBtIH+kaxANGT4TsK3utG4CsJYzp2j8pgHpkI7tU3kkdTkg4Plhd2wlAJWLfPtwdHiZ2m6c7 zaL9zTvAmsgUSKp6DssWTXUaB3geuh2M4vsjitfQz1j0UK+vFqmO76N08zhyrPSDglWcf8/UT fToALeFtJu7d6LxOrzO+vtaDbQNxo20K14k5wy/Ae9Coji95uyMvh98PDLTSRCXy4HPirrzrI D5YjstnAvIlVmI31zehLC0dKokcoa61NiwNeWjAlgSoQzUR/Y068bdVZr+VwBvqRAQCMcudsB xeYPqs4ncbriKSPhcUj0L06dHNPxcPZuqZEI0+drcEG2Mo6VTZe5Z03Tcts8rJNM1STb

T24gV2VkLCBGZWIgMTcsIDIwMTYgYXQgMDg6MzA6NDJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj5PbiBUdWUsIEZlYiAxNiwgMjAxNiBhdCA5OjQ0IFBNLCBHYXZpbiBTaGFuIDxnd3NoYW5A
bGludXgudm5ldC5pYm0uY29tPiB3cm90ZToKPj4gVGhlIGZ1bmN0aW9uIHVuZmxhdHRlbl9kdF9u
b2RlKCkgaXMgY2FsbGVkIHJlY3Vyc2l2ZWx5IHRvIHVuZmxhdHRlbgo+PiBkZXZpY2Ugbm9kZXMg
YW5kIHByb3BlcnRpZXMgaW4gdGhlIEZEVCBibG9iLiBJdCBsb29rcyBjb21wbGljYXRlZAo+PiBh
bmQgaGFyZCB0byBiZSB1bmRlcnN0b29kLgo+Pgo+PiBUaGlzIHNwbGl0cyB0aGUgZnVuY3Rpb24g
aW50byAzIGZ1bmN0aW9uczogcG9wdWxhdGVfcHJvcGVydGllcygpLAo+PiBwb3B1bGF0ZV9ub2Rl
KCkgYW5kIHVuZmxhdHRlbl9kdF9ub2RlKCkuIHBvcHVsYXRlX3Byb3BlcnRpZXMoKSwKPj4gd2hp
Y2ggaXMgY2FsbGVkIGJ5IHBvcHVsYXRlX25vZGUoKSwgY3JlYXRlcyBwcm9wZXJ0aWVzIGZvciB0
aGUKPj4gaW5kaWNhdGVkIGRldmljZSBub2RlLiBUaGUgbGF0ZXIgb25lIGNyZWF0ZXMgdGhlIGRl
dmljZSBub2Rlcwo+PiBmcm9tIEZEVCBibG9iLiBwb3B1bGF0ZV9ub2RlKCkgZ2V0cyB0aGUgb2Zm
c2V0IGluIEZEVCBibG9iIGZvcgo+PiBuZXh0IGRldmljZSBub2RlcyBhbmQgdGhlbiBjYWxscyBw
b3B1bGF0ZV9ub2RlKCkuIE5vIGxvZ2ljYWwKPj4gY2hhbmdlcyBpbnRyb2R1Y2VkLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBHYXZpbiBTaGFuIDxnd3NoYW5AbGludXgudm5ldC5pYm0uY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvb2YvZmR0LmMgfCAyNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE0NyBpbnNl
cnRpb25zKCspLCAxMDIgZGVsZXRpb25zKC0pCj4KPk9uZSBuaXQsIG90aGVyd2lzZToKPgo+QWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KPlsuLi5dCj4KPj4gKyAgICAg
ICAgICAgICAgIC8qIEFuZCB3ZSBwcm9jZXNzIHRoZSAiaWJtLHBoYW5kbGUiIHByb3BlcnR5Cj4+
ICsgICAgICAgICAgICAgICAgKiB1c2VkIGluIHBTZXJpZXMgZHluYW1pYyBkZXZpY2UgdHJlZQo+
PiArICAgICAgICAgICAgICAgICogc3R1ZmYKPj4gKyAgICAgICAgICAgICAgICAqLwo+PiArICAg
ICAgICAgICAgICAgaWYgKCFzdHJjbXAocG5hbWUsICJpYm0scGhhbmRsZSIpKQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBucC0+cGhhbmRsZSA9IGJlMzJfdG9fY3B1cCh2YWwpOwo+PiArCj4+
ICsgICAgICAgICAgICAgICBwcC0+bmFtZSAgID0gKGNoYXIgKilwbmFtZTsKPj4gKyAgICAgICAg
ICAgICAgIHBwLT5sZW5ndGggPSBzejsKPj4gKyAgICAgICAgICAgICAgIHBwLT52YWx1ZSAgPSAo
X19iZTMyICopdmFsOwo+Cj5UaGlzIGNhc3Qgc2hvdWxkIG5vdCBiZSBuZWVkZWQuCj4KCkl0J3Mg
bmVlZGVkLiBPdGhlcndpc2UsIHdlIHdpbGwgaGF2ZSB3YXJuaW5nLiBTbyBJIHdpbGwga2VlcCBp
dC4gSSBqdXN0CndlbnQgdGhyb3VnaCB0aGlzIG9uZSBmb3IgbmV4dCByZXZpc2lvbiBhbmQgc29y
cnkgZm9yIGxhdGUgcmVzcG9uc2UuCgpkcml2ZXJzL29mL2ZkdC5jOjIyNToxNDogd2FybmluZzog
YXNzaWdubWVudCBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRh
cmdldCB0eXBlCiAgIHBwLT52YWx1ZSAgPSB2YWw7CiAgICAgICAgICAgICAgXgoKVGhhbmtzLApH
YXZpbgoKPj4gKyAgICAgICAgICAgICAgICpwcHJldiAgICAgPSBwcDsKPj4gKyAgICAgICAgICAg
ICAgIHBwcmV2ICAgICAgPSAmcHAtPm5leHQ7Cj4+ICsgICAgICAgfQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGluZyBs
aXN0CkxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9y
Zy9saXN0aW5mby9saW51eHBwYy1kZXY=

--nextPart2044823.FFskJ8g9q3--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
