From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v1 27/34] NFC: st21nfcb: Add HCI protocol over NCI
 protocol support
Date: Wed, 28 Jan 2015 01:04:14 +0100
Message-ID: <20150128000414.GD32667@ribalta.mp.intel.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
 <1418072919-10535-28-git-send-email-christophe-h.ricard@st.com>
 <20150127004958.GB31396@ribalta.ger.corp.intel.com>
 <54C80E40.7020707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C80E40.7020707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "christophe.ricard" <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Tue, Jan 27, 2015 at 11:16:32PM +0100, christophe.ricard wrote:
> The main reason for making an st21nfcb_hci_core is because the hci network
> initialization procedure is proprietary.
> It is almost using only NCI standard commands but some id's and commands
> could be proprietary.
That could most likely be fixed with an additional NCI hook.


> I would ideally rely on the hci core framework but i run out of idea when
> trying this.
> However i think "exporting the relevant API for drivers to send HCI
> commands/events through their NCI connections."
Yes, the idea would be for the NCI core to create an hci_dev and
associate it with the right nci_dev (probably when the driver requests
it). Then you should be able to call into the HCI core API, even if it
takes exporting some of it.

> is a good idea i need to dig into. It will then needs to hci/nci hook for
> the proprietary stuff.
> 
> I have just one worry, when do you think those updates (patch 20 & 27) needs
> to be ready for your 3.20 pull request ?
I'm going to send a first pull request tomorrow. And a second one
beginning of next week. I realize it leaves you with very little time,
but I feel patch #27 is quite a bit of potentially duplicated code.
What about you look at patch #20 first and I could then take all your
patchset except for patches #27 and #28 ?

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
