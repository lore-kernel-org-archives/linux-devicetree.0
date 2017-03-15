From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 1/2] Documentation: DT: Add OV5647 bindings
Date: Wed, 15 Mar 2017 11:42:09 -0500
Message-ID: <20170315164209.p24r7mpyijbxleja@rob-hp-laptop>
References: <cover.1488798062.git.roliveir@synopsys.com>
 <e89902c0c99d0daf9ef821dd7a9c67e866b18a94.1488798062.git.roliveir@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e89902c0c99d0daf9ef821dd7a9c67e866b18a94.1488798062.git.roliveir@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, vladimir_zapolskiy@mentor.com, CARLOS.PALMINHA@synopsys.com, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Hans Verkuil <hans.verkuil@cisco.com>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 06, 2017 at 11:16:33AM +0000, Ramiro Oliveira wrote:
> Create device tree bindings documentation.
> 
> Signed-off-by: Ramiro Oliveira <roliveir@synopsys.com>
> ---
>  .../devicetree/bindings/media/i2c/ov5647.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt

There's no changelog here, so I can't tell if anything is changed, but I 
acked v7. Please add acks when sending new versions.
