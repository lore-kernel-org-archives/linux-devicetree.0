From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/6] arm64: Add DTS support for FSL's LS2085A SoC
Date: Fri, 15 Aug 2014 17:02:58 +0100
Message-ID: <20140815160258.GF18863@arm.com>
References: <1408096156-29772-1-git-send-email-bhupesh.sharma@freescale.com>
 <1408096156-29772-5-git-send-email-bhupesh.sharma@freescale.com>
 <20140815102329.GB596@leverpostej>
 <c43739ed82a34f6eb2adbbe240e07c5d@DM2PR03MB317.namprd03.prod.outlook.com>
 <0DC5667C-E45A-4781-9AE6-0C5E1C70F268@codeaurora.org>
 <9c8daab7efa446c884409ae3aaaaa151@BY2PR0301MB0743.namprd03.prod.outlook.com>
 <3537CF6F-9BF9-4905-B051-EB94034FC1C2@codeaurora.org>
 <77e80a2d69ee470a8458a85450a1510c@BY2PR0301MB0743.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <77e80a2d69ee470a8458a85450a1510c-swgC6WJTr6EFQ9CGjnlQrZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 15, 2014 at 04:49:53PM +0100, Stuart Yoder wrote:
> > On Aug 15, 2014, at 10:41 AM, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > So we want to do the standard/conventional thing here that will
> > > allow are device trees to be used in more than u-boot.
> > 
> > Well, I think the guys would say the standard thing is to move to PSCI.
> 
> Agree.  That is our plan.  But it looks like at this point in
> time all the device tree have a common denominator spin table
> mechanim that gets updated/overriden if PSCI is supported.

That's for historical reasons because at the time there was no PSCI and
now we have to preserve backwards compatibility with older boot
wrappers. The only hardware currently having a DT in the arm64 tree is
the APM one which cannot implement PSCI because there is no EL3.

(and I think we should really get a proper arm64 PSCI implementation in
U-Boot)

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
