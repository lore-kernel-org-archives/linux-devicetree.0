Return-Path: <devicetree-owner@vger.kernel.org>
Received: from phoenix3.szarvasnet.hu ([87.101.127.16]:35779 "EHLO
	mail.szarvasnet.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759410Ab3HNIjt (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 04:39:49 -0400
Message-ID: <520B4026.6060908@openwrt.org>
Date: Wed, 14 Aug 2013 10:30:30 +0200
From: Gabor Juhos <juhosg@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: add driver for the built-in PCI controller of the
 RT3883 SoC
References: <1376064212-28415-1-git-send-email-juhosg@openwrt.org> <52090650.3000309@imgtec.com>
In-Reply-To: <52090650.3000309@imgtec.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, John Crispin <blogic@openwrt.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

2013.08.12. 17:59 keltez�ssel, James Hogan �rta:
> On 09/08/13 17:03, Gabor Juhos wrote:
>> +   - status: either "disabled" or "okay"
> 
> Is this really a required property? If it's using the generic code for
> it then I think it will be treated as "okay" if omitted. 

You are right, it is optional. The driver explicitly does not checks the
presence of the property. However instead of removing this part from the doc, I
would change the text to indicate that the property is optional.

> In any case I don't think this property is normally documented in these
> bindings docs (I couldn't find any other instances of it).

It is documented in mvebu-pci.txt as well, at least in 3.11-rc5.

-Gabor

