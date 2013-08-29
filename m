From: Sean Young <sean@mess.org>
Subject: Re: [PATCH v2] media: st-rc: Add ST remote control driver
Date: Thu, 29 Aug 2013 13:01:46 +0100
Message-ID: <20130829120146.GA7811@pequod.mess.org>
References: <1377704030-3763-1-git-send-email-srinivas.kandagatla@st.com>
 <20130829091155.GA6162@pequod.mess.org>
 <521F307C.9040807@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <521F307C.9040807@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2013 at 12:29:00PM +0100, Srinivas KANDAGATLA wrote:
> On 29/08/13 10:11, Sean Young wrote:
> > On Wed, Aug 28, 2013 at 04:33:50PM +0100, Srinivas KANDAGATLA wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> >> +config RC_ST
> >> +	tristate "ST remote control receiver"
> >> +	depends on ARCH_STI && LIRC && OF
> > 
> > Minor nitpick, this should not depend on LIRC, it depends on RC_CORE.
> Yes, I will make it depend on RC_CORE, remove OF as suggested by Mauro
> CC and select LIRC to something like.
> 
> depends on ARCH_STI && RC_CORE
> select LIRC

The driver is usable with the kernel ir decoders, there is no need to 
select LIRC or use lirc at all.

You can either define a remote in drivers/media/rc/keymaps and set 
the rcdev->map_name, or it can be loaded at runtime using ir-keytable(1);
either way you don't need to use a lirc userspace daemon.


Sean
