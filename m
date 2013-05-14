From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2 2/9] Documentation: devicetree: Add DT bindings for UFS
 host controller
Date: Tue, 14 May 2013 11:08:49 -0700
Message-ID: <CAOesGMij6oKDr0BCRAnmz-r48S5FzzMcU_iyCyCyqkafWsmyNA@mail.gmail.com>
References: <1368515328-31535-1-git-send-email-draviv@codeaurora.org>
	<1368515328-31535-3-git-send-email-draviv@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <1368515328-31535-3-git-send-email-draviv@codeaurora.org>
Sender: linux-scsi-owner@vger.kernel.org
To: Dolev Raviv <draviv@codeaurora.org>
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sujit Reddy Thumma <sthumma@codeaurora.org>, "moderated list:OPEN FIRMWARE AND..." <devicetree-discuss@lists.ozlabs.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2013 at 12:08 AM, Dolev Raviv <draviv@codeaurora.org> wrote:
> Compatible list is used in commit 03b1781 but is not documented.
> Add necessary device tree bindings to describe on-chip UFS host
> controllers.
>
> Signed-off-by: Sujit Reddy Thumma <sthumma@codeaurora.org>
>
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> new file mode 100644
> index 0000000..20468b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -0,0 +1,16 @@
> +* Universal Flash Storage (UFS) Host Controller
> +
> +UFSHC nodes are defined to describe on-chip UFS host controllers.
> +Each UFS controller instance should have its own node.
> +
> +Required properties:
> +- compatible        : compatible list, contains "jedec,ufs-1.1"
> +- interrupts        : <interrupt mapping for UFS host controller IRQ>
> +- reg               : <registers mapping>
> +
> +Example:
> +       ufshc@0xfc598000 {
> +               compatible = "jedec,ufs-1.1";

Hmm.

Does jedec really specify the programming interface of this type of
device, register layout and meaning? It seems to be more about the
command set and electrical/connectivity specifications, no?


-Olof
