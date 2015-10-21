From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 4/9] NFC: nfcmrvl: allow low level drivers
 to configure head/tail room
Date: Wed, 21 Oct 2015 08:49:35 +0000
Message-ID: <21D2B1D4-8E68-46CD-A59A-192BA8EE8685@marvell.com>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-5-git-send-email-cuissard@marvell.com>,<20151021060030.GG11271@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151021060030.GG11271-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Content-Language: fr-FR
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Samuel,

> Le 21 oct. 2015 =E0 08:00, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> a =E9=
crit :
>=20
> Hi Vincent,
>=20
>> On Mon, Sep 28, 2015 at 02:33:09PM +0200, Vincent Cuissard wrote:
>> diff --git a/include/linux/platform_data/nfcmrvl.h b/include/linux/p=
latform_data/nfcmrvl.h
>> index ac91707..6f6ba27 100644
>> --- a/include/linux/platform_data/nfcmrvl.h
>> +++ b/include/linux/platform_data/nfcmrvl.h
>> @@ -26,6 +26,9 @@ struct nfcmrvl_platform_data {
>>    unsigned int reset_n_io;
>>    /* Tell if transport is muxed in HCI one */
>>    unsigned int hci_muxed;
>> +    /* Tell generic driver that the PHY requires some headroom spac=
e */
>> +    unsigned int phy_headroom;
>> +    unsigned int phy_tailroom;
> This does not seems to be a platform data, but rather a static one th=
at
> only depends on the selected PHY.
> It would make more sense to pass the selected PHY to
> nfcmrvl_nci_register_dev() and define the head and tail room dependin=
g
> on that.

Ok.

Br,
--=20
Vincent--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
