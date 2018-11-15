From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/2] Embedded USB Debugger (EUD) driver
Date: Thu, 15 Nov 2018 15:06:18 -0800
Message-ID: <20181115230618.GB26568@kroah.com>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
 <1542310374-18474-3-git-send-email-pheragu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542310374-18474-3-git-send-email-pheragu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 11:32:54AM -0800, Prakruthi Deepak Heragu wrote:
> Add support for control peripheral of EUD (Embedded USB Debugger) to
> listen to events such as USB attach/detach, charger enable/disable, pet
> EUD to indicate software is functional. Reusing the platform device kobj,
> sysfs entry 'enable' is created to enable or disable EUD.

If you add/remove/change a sysfs file, you need to also have a
Documentation/ABI/ file update as well.  Please do that here.

thanks,

greg k-h
