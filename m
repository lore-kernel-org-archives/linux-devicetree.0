From: Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Review Request: New proposal for device tree clock binding.
Date: Tue, 10 Aug 2010 12:56:24 +0800
Message-ID: <F9BD3E0A8083BE4ABAA94D7EDD7E3F631093B6@zch01exm26.fsl.freescale.net>
References: <AANLkTimm7G--LQHYBqPB1YCXQb7fSXPDaYsLq0p30DG1@mail.gmail.com>
	<F9BD3E0A8083BE4ABAA94D7EDD7E3F63109216@zch01exm26.fsl.freescale.net>
	<AANLkTi=3MQBSd_phbSZnRA-wFB7cfa4U_PKND+BgZVhd@mail.gmail.com>
	<F9BD3E0A8083BE4ABAA94D7EDD7E3F6310925F@zch01exm26.fsl.freescale.net>
	<AANLkTinQnFBcLiDyQtRRwzdAg_M48BnNsa2OyKWCiSUh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTinQnFBcLiDyQtRRwzdAg_M48BnNsa2OyKWCiSUh-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>> I've avoided requiring clock nodes to have a separate sub node for
>>> each output because it is more verbose and it prevents clock
>>> providers from having child nodes for other purposes. =A0Are you
>>> concerned that
>>
>> I don't see why there should be child nodes for other purposes under
>clock node.
>>
>>> having the <phandle>+output name pair will be difficult to manage?
>>
>> That's part of my concern.
>
>I was concerned about this too until I found precedence for doing the
>exact same thing in the pci binding (and ePAPR).  Mixing phandle and a
>string in this way doesn't bother me anymore.

Where exactly can I get the sample code for handling this binding?

- Leo
