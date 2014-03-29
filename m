From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC 1/5] of: Add support for ePAPR "stdout-path" property
Date: Sun, 30 Mar 2014 08:16:23 +1100
Message-ID: <1396127783.11529.55.camel@pasglop>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
	 <1396022885-6102-2-git-send-email-grant.likely@linaro.org>
	 <1396042396.11529.27.camel@pasglop>
	 <CAL_Jsq+xTeocLtS9GFWLCkoV+USACma+w0=O_ysekvTGhYVhZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+xTeocLtS9GFWLCkoV+USACma+w0=O_ysekvTGhYVhZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christoffer Dall <christoffer.dall@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-03-28 at 16:56 -0500, Rob Herring wrote:

> I'm working on getting just that working. See my series for "generic
> earlycon". I'm working on cleaning up the FDT part still, but have
> something functional. The "hardest" part with FDT is doing the address
> translation for serial devices, but I just stole that from u-boot.
> 
> > Right now, I have this explicit config option to hard wire "early debug"
> > but there are a few cases of field bugs that can happen in early init
> > code which I'd like to see logged properly on those systems, and early
> > debug isn't suitable for field use...
> 
> We have the same issue with multi-platform ARM kernels.

Ah excellent, I'll keep an eye on it !

Cheers,
Ben.
