From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Subject: Re: [PATCH V5 0/6] Introduce framework for SLIMbus device drivers
Date: Mon, 27 Jun 2016 10:30:57 +0900
Message-ID: <20160627103057.b462c058b7abed43e84f7c1c@linaro.org>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
	<20160603181419.f7e6fbb02a294d3161ab54d6@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160603181419.f7e6fbb02a294d3161ab54d6@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, masami.hiramatsu@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello Sagar,

On Fri, 3 Jun 2016 18:14:19 +0900
Masami Hiramatsu <masami.hiramatsu@linaro.org> wrote:

> Hi Sagar,
> 
> On Wed, 27 Apr 2016 17:58:03 -0600
> Sagar Dharia <sdharia@codeaurora.org> wrote:
> 
> > SLIMbus (Serial Low Power Interchip Media Bus) is a specification
> > developed by MIPI (Mobile Industry Processor Interface) alliance.
> > SLIMbus is a 2-wire implementation, which is used to communicate with
> > peripheral components like audio-codec.
> > SLIMbus uses Time-Division-Multiplexing to accommodate multiple data
> > channels, and control channel. Control channel has messages to do
> > device-enumeration, messages to send/receive control-data to/from
> > slimbus devices, messages for port/channel management, and messages to
> > do bandwidth allocation.
> > Framework is introduced to support  multiple instances of the bus
> > (1 controller per bus), and multiple slave devices per controller.
> > SPI and I2C frameworks, and comments from last time when I submitted
> > the patches were referred-to while working on this framework.
> > 
> > These patchsets introduce device-management, OF helpers, and messaging
> > APIs, controller driver for Qualcomm's slimbus controller, and
> > clock-pause feature for entering/exiting low-power mode for SLIMbus.
> > Framework patches to do channel, port and bandwidth
> > management are work-in-progress and will be sent out once these
> > initial patches are accepted.
> 
> I'm interested in this framework, especially the channel and port
> parts since it is needed for device drivers on the slimbus.
> Would you have any public git repository where I can review the
> work-in-progress part of the framework?

So, I've found git repositories on codeaurora.org,

https://source.codeaurora.org/

But there are too many repositories and branches to get the
correct working source code. Could you help me to find it?

Thank you,


-- 
Masami Hiramatsu <masami.hiramatsu@linaro.org>
