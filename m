From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [RFC v2 4/5] dts: bcm2837: add per-cpu clock devices
Date: Mon, 20 May 2019 14:19:04 +0200
Message-ID: <af50c1e9-5f52-e06b-8d0b-c9f72fba1324@i2se.com>
References: <20190520104708.11980-1-nsaenzjulienne@suse.de>
 <20190520104708.11980-5-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190520104708.11980-5-nsaenzjulienne@suse.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, ptesarik@suse.com, sboyd@kernel.org, viresh.kumar@linaro.org, mturquette@baylibre.com, linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, eric@anholt.net, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, mbrugger@suse.de, ssuloev@orpaltech.com
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On 20.05.19 12:47, Nicolas Saenz Julienne wrote:
> The four CPUs share a same clock source called pllb_arm. The clock can
> be scaled through the raspberrypi firmware interface.
do you see a problem with applying this also to bcm2835.dtsi and
bcm2836.dtsi?
