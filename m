From: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 0/1] Device Tree Schema Source format proposal
Date: Sat, 19 Oct 2013 07:43:59 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B50EAADA29@NA-MBX-03.mgc.mentorg.com>
References: <9610740.2oBMxfeRkE@amdc1227>
	<526158F3.4060104@baylibre.com>,<CAKON4OzqFtp8YKNvAxBnEwjTL1NS28OZW3AoVdCmu=+q9XWXog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKON4OzqFtp8YKNvAxBnEwjTL1NS28OZW3AoVdCmu=+q9XWXog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tomasz Figa writes:
> In this vision there would be a schema file for uarts. And another one
> for spi. Another one for gpio, etc. These file would document all
> possible attributes for these nodes.

I agree.    I am giving a talk on some of these topics next Thursday at 10:40 at ELCE:

http://embeddedlinuxconferenceeu2013.sched.org/event/1673ef2c8772d377ecc6d843589fa821?iframe=no&w=900&sidebar=yes&bg=no

The slides are at 

http://she-devel.com/DT_ELCE_2013.pdf
http://she-devel.com/DT_ELCE_2013.odp

I apologize for promoting my talk, but in it I discuss several ideas about schemata, DTS overlays, DTB-signing, etc. in a somewhat organized format.    Thanks to Pantelis Antoniou, David Woodhouse, Tom Rini, and a host of others for corrections (although they may continue to disapprove of the result).

Besides Tomasz' idea above about subsystem schemata, there's the possibility of using different DTSI include files in a similar fashion.    The concept is to have a series of uart.dtsi, spi.dtsi, gpio.dtsi in the spirit of skeleton.dtsi.   These device DTSI would be akin to function prototypes, essentially an abstract class specification that should be extended only rarely.    I find Neil Brown's older LWN articles about object-embedded practices in the kernel inspiring in this regard.

I apologize for not writing timely posts to the device-tree mailing list, but have trouble keeping up with the traffic.

-- 
Alison Chaiken
Mentor Embedded Software
in Edinburgh Hotel Grosvenor starting Monday

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
