From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 2/9] NFC: NCI: export nci_send_frame
 function
Date: Thu, 22 Oct 2015 17:43:18 +0200
Message-ID: <20151022154318.GA7633@zurbaran.home>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-3-git-send-email-cuissard@marvell.com>
 <20151021055750.GE11271@zurbaran.home>
 <DFA9399D-2B41-4EE2-831F-DB7011AB1127@marvell.com>
 <1CC98D3D-42C1-43A4-87A3-3802863B956A@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1CC98D3D-42C1-43A4-87A3-3802863B956A-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Wed, Oct 21, 2015 at 10:12:06PM +0000, Vincent Cuissard wrote:
> Hi Samuel,
>=20
> >> Le 21 oct. 2015 =E0 07:57, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> a =
=E9crit :
> >>=20
> >> Hi Vincent,
> >>=20
> >>> On Mon, Sep 28, 2015 at 02:33:07PM +0200, Vincent Cuissard wrote:
> >>> Export nci_send_frame symbol to allow drivers to use it.
> >>> This is needed for example if NCI is used during firmware
> >>> download phase.
> >> If what you need is a way to directly send completely custom frame=
s then
> >> I'd prefer that you export a routine that puts such frame on the
> >> cmd_q skb queue and schedule the cmd_work work.
> >=20
> > I need this to send frames over our proprietary logical connection =
for fw download.
> >=20
> > I will check if I can use the conn create and nci_send_cmd.
>=20
> I have checked. I should be able to use nci_send_cmd without hacking =
the whole code. For logical connection I still need nci_send_frame beca=
use related APIs are synchrounous and not designed to be used when devi=
ce is not up. I tried to tweak this but the code became too ugly since =
in my driver I got to forward some packets to core RX while keeping han=
dling others in my workqueue. The code was really unreadable.
>=20
> I will send a v3 with nci_send_cmd usage.
>=20
> BTW, keep in mind that this fw download code is a proprietary protoco=
l based on NCI style frames. I tried to reuse all generic functions but=
 I don't want to complexify the driver and the core part for such propr=
ietary stuff.
>
Sure. The idea is to make it simpler and less error prone by avoiding
code duplication, not the other way around.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
