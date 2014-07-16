From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Wed, 16 Jul 2014 13:32:44 +0200
Message-ID: <5773443.uubaG3Evxs@wuerfel>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org> <5340858.B9CZUE8s0j@wuerfel> <53C65F22.20101@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53C65F22.20101@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Mark Rutland <Mark.Rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, "mporter@linaro.org" <mporter@linaro.org>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "s-anna@ti.com" <s-anna@ti.com>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "patches@linaro.org" <patches@linaro.org>, "Mollie.Wu@tw.fujitsu.com" <Mollie.Wu@tw.fujitsu.com>, t.takinishi@jp.fu
List-Id: devicetree@vger.kernel.org

On Wednesday 16 July 2014 12:16:50 Sudeep Holla wrote:
> 
> Agreed if these mbox-names are more specific to attached devices and that
> was my initial understanding too. But I got confused when I saw something
> like below in the patch[1]
> 
> +       mhu: mhu0@2b1f0000 {
> +               #mbox-cells = <1>;
> +               compatible = "fujitsu,mhu";
> +               reg = <0 0x2B1F0000 0x1000>;
> +               interrupts = <0 36 4>, /* LP Non-Sec */
> +                            <0 35 4>, /* HP Non-Sec */
> +                            <0 37 4>; /* Secure */
> +       };
> +
> +       mhu_client: scb@0 {
> +               compatible = "fujitsu,scb";
> +               mbox = <&mhu 1>;
> +               mbox-names = "HP_NonSec";
> +       };
> 
> Here the name used is more controller specific.

The name is definitely specific to the client, not the master. The
string "HP_NonSec" should be required in the binding for the "fujitsu,scb"
device here, and the scb driver should pass that hardcoded string
to the mailbox API to ask for a channel.

	Arnd
