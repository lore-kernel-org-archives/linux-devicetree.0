From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: Use of the pwm-names DT property
Date: Wed, 4 Jul 2012 16:48:31 +0900
Message-ID: <4FF3F54F.1060809@nvidia.com>
References: <4FF3E862.8050101@nvidia.com> <20120704073942.GC25386@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120704073942.GC25386@avionic-0098.mockup.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed 04 Jul 2012 04:39:42 PM JST, Thierry Reding wrote:
> In fact the *-names properties are rather common. They are used for the
> reg and interrupts properties. The pinctrl subsystem and the upcoming
> clock bindings also use the *-names properties. So one could just as
> well argue that the regulator and gpio bindings should have been using
> regulator-names and gpio-names respectively instead.

I was not aware of that, thanks for the explanation. Too bad the DT is 
already split in two different ways for naming things.

Alex.
