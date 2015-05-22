From: Yann Droneaud <ydroneaud@opteya.com>
Subject: Re: Device Tree Blob (DTB) licence
Date: Fri, 22 May 2015 21:27:12 +0200
Message-ID: <1432322832.5304.63.camel@opteya.com>
References: <1430820315.19516.26.camel@opteya.com>
	 <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com>
	 <1432289148.5304.58.camel@opteya.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-dGnd+suWiOn/NMg41of9"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432289148.5304.58.camel@opteya.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--=-dGnd+suWiOn/NMg41of9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

[removing Cc: licensing@fsf.org]

Le vendredi 22 mai 2015 à 12:05 +0200, Yann Droneaud a écrit :
> Le mardi 05 mai 2015 à 11:41 -0500, Rob Herring a écrit :
> > On Tue, May 5, 2015 at 5:05 AM, Yann Droneaud <ydroneaud@opteya.com
> > > 
> > wrote:
> > > 
> > > I believe Device Tree Blob (.dtb file) built from kernel's Device 
> > > 
> > > Tree
> > > Sources (.dts, which #include .dtsi, which #include .h) using 
> > > Device
> > > Tree Compiler (dtc) are covered by GNU General Public Licence v2
> > > (GPLv2), but cannot find any reference.
> > 
> > By default yes, but we've been steering people to dual license them 
> > 
> > GPL/BSD.
> > 
> 
> Can you give me the rationale behind such dual licenses requirement ?
> 
> If a BSD .dts includes GPLv2 .h, the whole is covered by GPLv2,
> so I cannot find a case where a BSD covered .dts file could be used
> alone within BSD license rights.
> 
> > > As most .dtsi in arch/arm/boot/dts/ are covered by GPLv2, and,
> > > as most .h in include/dt-bindings/ are also covered by GPLv2,
> > > the source code is likely covered by GPLv2.
> > > 
> > > Then this source code is translated in a different language 
> > > (flattened
> > > device tree), so the resulting translation is also likely covered 
> > > 
> > > by
> > > GPLv2.
> > > 
> > > So, when I'm proposed to download a .dtb file from a random 
> > > vendor,
> > > can I require to get the associated source code ?
> > 
> > I believe so yes. However, you already have the "source" for the 
> > most
> > part. Just run "dtc -I dtb -O dts <dtb file>". You loose the
> > preprocessing and include structure though (not necessarily a bad
> > thing IMO).
> > 
> > Then the question is what is the license on that generated dts!
> > 
> 
> That's also a good question.
> 
> Is this a form a "reverse engineering" with all the legalese burden ?
> 
> Anyway without a clear information attached to the DTB, it's 
> difficult
> to tell which licence cover the "decompiled" version.
> 
> > > Anyway, for a .dtb file generated from kernel sources, it's 
> > > rather
> > > painful to look after all .dts, .dtsi, .h, to find what kind of
> > > licences are applicables, as some are covered by BSD, dual 
> > > licensed
> > > (any combination of X11, MIT, BSD, GPLv2).
> > 
> > I imagine the includes cause some licensing discrepancies if you 
> > dug 
> > into it.
> > 
> 
> It's a pity, and it's probably something to sort out.
> 
> DTB files produced as part of kernel compilation should have a well
> known license attached by default.
> 

I've added licensing@fsf.ogrg in Cc: in my previous message to have an 
advice on this subject, but I failed to notice licensing@fsf.org 
is not a mailing list: I was assigned request ID [gnu.org #1017262].

Regards.

-- 
Yann Droneaud
OPTEYA

--=-dGnd+suWiOn/NMg41of9
Content-Disposition: inline
Content-Description: Message joint - [gnu.org #1017262] AutoReply concerning
 licensing question: Re: Device Tree Blob (DTB) licence
Content-Type: message/rfc822

Return-Path: <www-data@gnu.org>
Delivered-To: <ydroneaud@opteya.com>
Received: from ou.quest-ce.net by ou.quest-ce.net (Dovecot) with LMTP id
 fBsuMl4KX1VLIAAAEWxVLQ for <ydroneaud@opteya.com>; Fri, 22 May 2015
 12:52:14 +0200
Received: from rt.gnu.org ([74.94.156.213]) by ou.quest-ce.net with esmtps
 (TLS1.0:RSA_AES_256_CBC_SHA1:256) (Exim 4.80) (envelope-from
 <www-data@gnu.org>) id 1YvkYo-00029F-83 for ydroneaud@opteya.com; Fri, 22
 May 2015 12:52:14 +0200
Received: from www-data by rt.gnu.org with local (Exim 4.69) (envelope-from
 <www-data@gnu.org>) id 1YvjqK-0002Qr-Qu for ydroneaud@opteya.com; Fri, 22
 May 2015 06:06:16 -0400
From: "FSF Licensing Questions via RT" <licensing@fsf.org>
Reply-To: licensing@fsf.org
In-Reply-To: <1432289148.5304.58.camel@opteya.com>
References: <RT-Ticket-1017262@rt.gnu.org>
	 <1430820315.19516.26.camel@opteya.com>
	 <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com>
	 <1432289148.5304.58.camel@opteya.com>
Message-ID: <rt-3.4.5-24484-1432289176-201.1017262-48-0@rt.gnu.org>
Precedence: bulk
X-RT-Loop-Prevention: gnu.org
RT-Ticket: gnu.org #1017262
Managed-by: RT 3.4.5 (http://www.bestpractical.com/rt/)
RT-Originator: ydroneaud@opteya.com
To: ydroneaud@opteya.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date: Fri, 22 May 2015 06:06:16 -0400
Received-SPF: pass client-ip=74.94.156.213; envelope-from=www-data@gnu.org;
 helo=rt.gnu.org
X-SA-Exim-Connect-IP: 74.94.156.213
X-SA-Exim-Mail-From: www-data@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on ou.quest-ce.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
 T_RP_MATCHES_RCVD,URIBL_BLOCKED autolearn=ham version=3.3.2
Subject: [gnu.org #1017262] AutoReply concerning licensing question: Re:
 Device Tree Blob (DTB) licence
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on ou.quest-ce.net)
X-Evolution-Source: 1388004808.11925.2@test.quest-ce.net
Content-Transfer-Encoding: quoted-printable

This message has been automatically generated in response to a
licensing question you sent to the Free Software Foundation, with subject:
	"Re: Device Tree Blob (DTB) licence".

There is no need to reply to this message right now.  Your request has
been assigned an ID of [gnu.org #1017262].

Please include the string:
         [gnu.org #1017262]
in the subject line of all future correspondence about this issue.  To do
so, you may reply to this message.


Thank you so much for writing to the Free Software Foundation's
Licensing and Compliance Lab. Questions sent to this address are
answered largely by volunteers, with the help of FSF staff. We have the
following licensing resources available which you might find helpful:

Licensing FAQ page: http://www.gnu.org/licenses/gpl-faq.html
Text of the GNU GPL: http://www.gnu.org/licenses/gpl.html
Text of the GNU LGPL: http://www.gnu.org/licenses/lgpl.html
Text of the GNU AGPL: http://www.gnu.org/licenses/agpl.html
Our license list page: http://www.gnu.org/licenses/license-list.html

We can always use more help in answering licensing questions (check out
our license team page on Libreplanet if you are interested in helping
out <http://libreplanet.org/wiki/Group:Free_Software_Foundation/Licensing_V=
olunteers>),
so we thank you for your patience as you await a response. You can also
help the licensing team by making a donation at <donate.fsf.org>. Your dona=
tions are
what enable us to offer this service to the community.

We do offer consulting services for companies who are working to develop
products that incorporate free software so that they can do so in ways
that comply with the terms of the GPL and other free software licenses.
If you are interested in this service, please write a separate message
to compliance-lab@fsf.org.

                        Sincerely,
                        FSF GPL Compliance Lab Office

--=-dGnd+suWiOn/NMg41of9--
