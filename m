From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 08/13] NFC: dts: st21nfca: Fix compatible string
 spelling to follow other drivers
Date: Tue, 2 Dec 2014 22:52:52 +0100
Message-ID: <20141202215252.GA23146@ribalta.ger.corp.intel.com>
References: <1417552078-9269-1-git-send-email-christophe-h.ricard@st.com>
 <1417552078-9269-9-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417552078-9269-9-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Tue, Dec 02, 2014 at 09:27:53PM +0100, Christophe Ricard wrote:
> Other drivers are following the following compatible string format for dts:
> s/_/-/
You're basically breaking an ABI here. If anyone has built and shipped
a DT binding firmware with the current compatible string, you're
making sure 3.19 won't work with their firmware.
I know it's very unlikely, but for the sake of it I prefer not taking
that patch and the following one.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
