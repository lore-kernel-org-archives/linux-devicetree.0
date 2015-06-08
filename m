From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC v2 00/18] Few fixes, add hibernate and ST21NFCC support
Date: Tue, 9 Jun 2015 00:37:21 +0200
Message-ID: <20150608223721.GJ5089@ribalta.mp.intel.com>
References: <1433589413-19680-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433589413-19680-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Sat, Jun 06, 2015 at 01:16:36PM +0200, Christophe Ricard wrote:
> Hi Samuel,
> 
> Sorry for the delay.
No worries.

> I agree with your proposal. However, i added an additionnal minor fix patch
> to get it to work.
I squashed the first 2 patches.


> I also got to the option to add a specific handler to send proprietary commands.
Sure.

The last patch did not apply properly because I had to fix patch #16 as
it was using some symbols defined in patch #17.
Could you please resend me a rebased patch #17, I applied and pushed
patches [1-16] to nfc-next.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
