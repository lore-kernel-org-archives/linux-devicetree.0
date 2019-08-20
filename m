From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [RESEND PATCHv4 0/1] drivers/amba: add reset control to amba
Date: Tue, 20 Aug 2019 09:58:33 -0500
Message-ID: <20190820145834.7301-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: dinguyen@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux@armlinux.org.uk, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com, daniel.thompson@linaro.org, linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

Even though this patch is a V4, I'm including more people in this review
cycle because I found that there was previous patch[1] that was discussed.

Thanks,
Dinh


[1] https://patchwork.kernel.org/patch/10845695/

Dinh Nguyen (1):
  drivers/amba: add reset control to amba bus probe

 drivers/amba/bus.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.20.0
