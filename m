From: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: [PATCH 2/2] ARC: [axs10x] Specify reserved memory for frame
 buffer
Date: Thu, 28 Apr 2016 19:26:35 +0530
Message-ID: <57221693.50401@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
 <1461767701-12208-3-git-send-email-abrodkin@synopsys.com>
 <572190F3.3020709@synopsys.com> <1461851171.3673.30.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461851171.3673.30.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <public-Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@plane.gmane.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, lkml <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 28 April 2016 07:16 PM, Alexey Brodkin wrote:
>> > Note that the IOC start alignment needs to follow
>> > max(4k, size). What will be maximum size of frame buffer - 16M always !
> What do you mean by that?

For HS38, we intend to bypass the frame buffer traffic from IOC port. So the frame
buffer start needs to be inside the IOC aperture base address. That value can't be
arbitrary - it is atleast 4K aligned value and further also needs to be aligned to
the size of aperture. So if the size is 16M it needs to be 16M aligned etc...

-Vineet
