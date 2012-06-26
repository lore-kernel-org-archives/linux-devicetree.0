From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: [PATCH 5/5] usb: gadget: composite: parse dt overrides
Date: Tue, 26 Jun 2012 21:18:48 +0200
Message-ID: <op.wgiylmt83l0zgt@mpn-glaptop>
References: <1340720833-781-1-git-send-email-aletes.xgr@gmail.com>
 <1340720833-781-6-git-send-email-aletes.xgr@gmail.com>
 <4FEA02B7.3030801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FEA02B7.3030801@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>, Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Yang <leoli@freescale.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

> On 06/26/2012 09:27 AM, Alexandre Pereira da Silva wrote:
>> Grab the devicetree node properties to override VendorId, ProductId,
>> bcdDevice, Manucacturer, Product and SerialNumber

Like before, the code looks good to me:

Acked-by: Michal Nazarewicz <mina86@mina86.com>

Not commenting on the other aspects of the business logic though.

On Tue, 26 Jun 2012 20:43:03 +0200, Rob Herring <robherring2@gmail.com>=
 wrote:
> I'm still confused about what is the order of priority for the 2
> possible sources of these values. The way it is written, the DT value=
 is
> a default, not an override.

They are overwritten by module parameter but they are overwriting anyth=
ing that
composite gadget might be providing.

--=20
Best regards,                                         _     _
=2Eo. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
=2E.o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarew=
icz    (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
