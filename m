From: Niklas Cassel <niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/6] *** Add support for wifi QMI client handshakes ***
Date: Fri, 12 Oct 2018 14:09:24 +0200
Message-ID: <20181012120924.GA1030@centauri.lan>
References: <20180815092637.11455-1-govinds@codeaurora.org>
 <20181009003628.GA253926@ban.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181009003628.GA253926-1WoqFLEneaORBCj4nEdE8WJtCfot02Oa@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2018 at 05:36:30PM -0700, Brian Norris wrote:
> + linux-msm
> 
> Hi Govind, Kalle,
> 
> On Wed, Aug 15, 2018 at 02:56:31PM +0530, Govind Singh wrote:
> > Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> > This module is responsible for communicating WLAN control messages to FW
> > over QMI interface. This patch series enables the qmi handshakes required for
> > WCN3990 chipset.
> [...]
> 
> What's the status of this patchset? It has seen various stages of
> review, and except for the fact that Govind seems to have dropped
> various Reviewed-by/Acked-by tags (which Rob noticed), I don't see any
> relevant feedback that should be blocking it.
> 
> I previously had concerns about the firmware boot sequence -- that it
> required a Qualcomm-specific TFTP service over QRTR, which had no open
> source implementations. There is now a published daemon that worked for
> me [1], as well as firmware releases that loaded modem and Wifi firmware
> together, such that this TFTP service is not needed at all. So my
> concerns there are no longer blocking.
> 
> And I think Rob already reviewed the relevant DT bindings (but again,
> Govind missed collecting that tag for this series).
> 
> So the only outstanding request I see is to collect the appropriate
> tags. Should Govind resend the whole series just for that?
> 
> FWIW, I've been using this series for a while now, and I reviewed
> earlier versions. I can provide this for the whole series:
> 
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hello Kalle,

I see that this patch series has been added to your master-pending branch.

It seems to be lacking Brians Reviewed-by tags (from above).


The diff between v4 and v5 is just:

+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1010,10 +1010,10 @@ int ath10k_qmi_deinit(struct ath10k *ar)
        struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
        struct ath10k_qmi *qmi = ar_snoc->qmi;
 
+       qmi_handle_release(&qmi->qmi_hdl);
        cancel_work_sync(&qmi->event_work);
        destroy_workqueue(qmi->event_wq);
-       qmi_handle_release(&qmi->qmi_hdl);
-       qmi = NULL;
+       ar_snoc->qmi = NULL;
 
        return 0;
 }

I've given my Acked-by on v4:
https://patchwork.kernel.org/cover/10540111/
The change between v4 and v5 does not warrant the removal of those tags,
so please re-add them.

Rob has given his Reviewed-by on the dt-binding on v4:
https://patchwork.kernel.org/patch/10540115/
The dt-binding hasn't changed between v4 and v5, so please re-add it.


I also noted that kbuild test robot complain about this series on x86:
http://lists.infradead.org/pipermail/ath10k/2018-October/012268.html
Are test errors still valid?

My patch series that makes QMI_HELPERS selectable for compile test
(e.g. x86), is queued up for 4.20~5.0:
https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/log/?h=qcom-drivers-for-4.20

Does this patch series make the errors go away, or are they unrelated?


Kind regards,
Niklas

> 
> If nothing else, I think it's important to get someone to merge the DT
> bindings from this series, because Govind is now trying to extend the DT
> binding and to enable the WCN3990 device node in the SDM845 device tree
> nodes.
> 
> Regards,
> Brian
> 
> [1] https://github.com/andersson/tqftpserv
> [2] See this series:
>     https://patchwork.kernel.org/cover/10621863/
>     Govind didn't send it to the right mailing lists yet, but we're
>     close...
