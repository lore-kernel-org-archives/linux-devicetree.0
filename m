From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] RTC: rv3029: fix vendor string
Date: Wed, 20 Sep 2017 15:52:22 -0500
Message-ID: <20170920205222.u445mraruddz3ufl@rob-hp-laptop>
References: <20170915020004.24272-1-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170915020004.24272-1-alexandre.belloni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 04:00:02AM +0200, Alexandre Belloni wrote:
> The vendor string for Microcrystal is microcrystal.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.txt | 2 +-
>  drivers/rtc/rtc-rv3029c2.c                            | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
