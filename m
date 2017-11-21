From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 05/20] firmware: arm_scmi: add scmi protocol bus to
 enumerate protocol devices
Date: Tue, 21 Nov 2017 18:04:39 +0000
Message-ID: <273d655b-b1f2-0788-aa60-3d97b84e7304@arm.com>
References: <1509720477-18936-1-git-send-email-sudeep.holla@arm.com>
 <1509720477-18936-6-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509720477-18936-6-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 03/11/17 14:47, Sudeep Holla wrote:
> The SCMI specification encompasses various protocols. However, not every
> protocol has to be present on a given platform/implementation as not
> every protocol is relevant for it.
> 
> Furthermore, the platform chooses which protocols it exposes to a given
> agent. The only protocol that must be implemented is the base protocol.
> The base protocol is used by an agent to discover which protocols are
> available to it.
> 
> In order to enumerate the discovered implemented protocols, this patch
> adds support for a separate scmi protocol bus. It also adds mechanism to
> register support for different protocols.
> 
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Extremely sorry to both during merge window, but just wanted to check if
you can spare sometime reviewing these SCMI patches. I know it's too
early for v4.16 but with holiday period ahead, thought of checking so
that I won't miss v4.16

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
