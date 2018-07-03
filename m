From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1] ARM: dts: imx51-zii-rdu1: correct touchscreen axis
 inversion
Date: Tue, 3 Jul 2018 14:12:14 +0800
Message-ID: <20180703061212.GG4348@dragon>
References: <20180628225626.26203-1-nick@shmanahar.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180628225626.26203-1-nick@shmanahar.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Dyer <nick@shmanahar.org>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 11:56:26PM +0100, Nick Dyer wrote:
> The RMI4 touchscreen driver applied inversion and axis swap in the
> wrong order, violating the DT binding for those properties. This was fixed in
> 645a397, so correct the RDU1 DT to apply the inversion to the
> correct axis.
> 
> Tested on Zii RDU1 00-5105-30 rev B
> 
> Signed-off-by: Nick Dyer <nick@shmanahar.org>

Applied, thanks.
