From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 22:11:36 +0100
Message-ID: <201103182211.36869.arnd@arndb.de>
References: <4D83A25C.804@ti.com> <20110318182518.GA2271@opensource.wolfsonmicro.com> <4D83BA4F.8050301@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D83BA4F.8050301@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.green@linaro.org
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, David Anders <x0132446@ti.com>, Greg KH <greg@kroah.com>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Linux USB list <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 March 2011, Andy Green wrote:
> In which case, they are all potential consumers of a MAC "stored in an 
> alternative location and needs to be programmed into the NIC by 
> software" solution, which he also thinks is needed.

Note that there is also of_get_mac_address(), which is meant to
deal with this exact problem.

	Arnd
