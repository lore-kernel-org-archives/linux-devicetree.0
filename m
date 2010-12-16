From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH v4 5/5] fsl-diu-fb: Support setting display mode using EDID
Date: Thu, 16 Dec 2010 10:55:10 -0600
Message-ID: <4D0A446E.5020600@freescale.com>
References: <1279893639-24333-1-git-send-email-agust@denx.de>
	<1279893639-24333-6-git-send-email-agust@denx.de>
	<AANLkTin-TL5_TKnyHYtZdixosfqpkPNoarSTC+K4tTUb@mail.gmail.com>
	<AANLkTi=NwY_gcBXeKXeGX-qist3tMQ4EWqj3twYGfeWD@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <AANLkTi=NwY_gcBXeKXeGX-qist3tMQ4EWqj3twYGfeWD@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@ozlabs.org, linux-fbdev@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> This is for devices which don't have an i2c edid channel.

So are we expecting board-specific code in U-Boot to add the data to the device
tree?

-- 
Timur Tabi
Linux kernel developer at Freescale
