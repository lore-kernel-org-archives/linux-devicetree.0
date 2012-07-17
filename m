From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH RESEND v4] USB: ehci-s5p: Add vbus setup function to the
 s5p ehci glue layer
Date: Wed, 18 Jul 2012 07:54:17 +0900
Message-ID: <000601cd646f$18a86910$49f93b30$%han@samsung.com>
References: <1342523006-8379-1-git-send-email-gautam.vivek@samsung.com>
 <1342523006-8379-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1342523006-8379-2-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, greg@kroah.com, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: l.majewski@samsung.com, a.kesavan@samsung.com, prashanth.g@samsung.com, kmpark@infradead.org, joshi@samsung.com, olofj@google.com, thomas.abraham@linaro.org, sshtylyov@mvista.com, jy0922.shim@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tuesday, July 17, 2012 8:03 PM, Vivek Gautam wrote:
> 
> This patch retrieves and configures the vbus control gpio via
> the device tree. The suspend/resume callbacks will be later
> modified for vbus control.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

Acked-by: Jingoo Han <jg1.han@samsung.com>
