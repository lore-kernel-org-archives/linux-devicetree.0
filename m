From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 3/4] drivers: edac: Add cache erp driver for Last
 Level Cache Controller (LLCC)
Date: Tue, 31 Jul 2018 06:22:59 +0200
Message-ID: <20180731042259.GD13258@nazgul.tnic>
References: <1532540697-26630-1-git-send-email-vnkgutta@codeaurora.org>
 <1532540697-26630-4-git-send-email-vnkgutta@codeaurora.org>
 <20180729034927.GA2916@nazgul.tnic>
 <090d55ef84af7bc6c750b93219408437@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <090d55ef84af7bc6c750b93219408437@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vnkgutta@codeaurora.org
Cc: evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 02:38:01PM -0700, vnkgutta@codeaurora.org wrote:
> Do you mean the Signed-off-by lines above? That's because
> Channagoud is the one who is the original author of this driver,
> and I'm the one who did the incremental changes (changes in llcc)
> and uploading it upstream.
> That's why the Signed-off is like that.
> Which way do you think it should be?

Then you need to figure out between you two who the author should be
because we have single authorship. When you do, commit it in git with

git commit --amend --author=...

so that that is reflected properly.

For expressing stuff like co-authorship we have

Co-Developed-by:

All explained in submitting-patches.rst.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
