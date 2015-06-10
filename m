From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform
 devices
Date: Wed, 10 Jun 2015 08:40:31 -0700
Message-ID: <20150610154031.GB22214@kroah.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com>
 <20150608184713.446B7C406AA@trevor.secretlab.ca>
 <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
 <20150609110044.61031C40580@trevor.secretlab.ca>
 <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com>
 <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com>
 <CAMAWPa-bGwVCnmv=H=8Zo-NCw-nOFBj3-XcVvb-0m0sNYtPO7g@mail.gmail.com>
 <CAPybu_2dpcpjPvn-kXaW-yC2OmkNPna+G8PLO-gP1cMBOcU_ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPybu_2dpcpjPvn-kXaW-yC2OmkNPna+G8PLO-gP1cMBOcU_ew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Tyler Baker <tyler.baker@linaro.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 10, 2015 at 04:46:33PM +0200, Ricardo Ribalda Delgado wrote:
> Hello Greg
> 
> On Wed, Jun 10, 2015 at 4:38 PM, Kevin Hilman <khilman@kernel.org> wrote:
> > On Wed, Jun 10, 2015 at 12:11 AM, Ricardo Ribalda Delgado
> 
> > At this stage of the cycle (merge window opening soon, maintainers
> > trying to stabilize their stuff for Linus) we want to see linux-next
> > approaching some level of stability.
> 
> Please revert
> 
> base/platform: Only insert MEM and IO resources
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=36d4b29260753ad78b1ce4363145332c02519adc
> base/platform: Continue on insert_resource() error
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=e50e69d1ac4232af0b6890f16929bf5ceee81538
> of/platform: Use platform_device interface
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=b6d2233f2916fa9338786aeab2e936c5a07e4d0c
> base/platform: Remove code duplication
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=6d9d4b1469b0d9748145e168fc9ec585e1f3f4b0

Now reverted.

> This patch from Grant needs to be applied:
> 
> [PATCH 2/2] drivercore: Fix unregistration path of platform devices

I need some acks before I apply anything else as this is a total mess.

greg k-h
