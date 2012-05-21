From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: mfd: mc13xxx: add codec platform data
Date: Mon, 21 May 2012 17:34:59 +0300
Message-ID: <20120521143459.GA25114@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: philippe.retornaz-p8DiymsW2f8@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Philippe R=E9tornaz,

This is a semi-automatic email about new static checker warnings.

The patch e3a0871c8f67: "mfd: mc13xxx: add codec platform data" from =

May 15, 2012, leads to the following Smatch complaint:

drivers/mfd/mc13xxx-core.c:695 mc13xxx_common_init()
	 error: we previously assumed 'pdata' could be null (see line 687)

drivers/mfd/mc13xxx-core.c
   686	=

   687		if (mc13xxx_probe_flags_dt(mc13xxx) < 0 && pdata)
                                                          ^^^^^^
Old check.

   688			mc13xxx->flags =3D pdata->flags;
   689	=

   690		if (mc13xxx->flags & MC13XXX_USE_ADC)
   691			mc13xxx_add_subdevice(mc13xxx, "%s-adc");
   692	=

   693		if (mc13xxx->flags & MC13XXX_USE_CODEC)
   694			mc13xxx_add_subdevice_pdata(mc13xxx, "%s-codec",
   695						pdata->codec, sizeof(*pdata->codec));
                                                ^^^^^^^^^^^^
New dereference.

   696	=

   697		if (mc13xxx->flags & MC13XXX_USE_RTC)

regards,
dan carpenter
