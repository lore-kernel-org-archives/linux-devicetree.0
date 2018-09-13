From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: quanta-q71l: Add four PSUs
Date: Fri, 14 Sep 2018 08:56:09 +0930
Message-ID: <CACPK8Xc=-MXoJJaKFs5L-j8F7JCZmsxK0cD4i1ySS8SZQMKwwg@mail.gmail.com>
References: <20180831205855.242061-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180831205855.242061-1-venture@google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Patrick Venture <venture@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, 1 Sep 2018 at 06:29, Patrick Venture <venture@google.com> wrote:
>
> Enable the four PSUs via generic PMBUS.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> Changes for v2:
>  - Fixed the commit header typo s/q7l1/q71l/

I've applied both of these to dt-for-v4.20.

Cheers,

Joel
