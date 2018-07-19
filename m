From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/5] ARM64: amlogic: add support for the S905W and two
 boards
Date: Thu, 19 Jul 2018 12:38:37 -0500
Message-ID: <7heffzm8gy.fsf@baylibre.com>
References: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 14 Jul 2018 21:37:20 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com, yixun.lan@amlogic.com, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The goal of this series is to to add support for the Amlogic S905W SoC
> along with Amlogic's P281 development board and the Tanix TX3 Mini (which
> both use the S905W SoC).
>
> I am sending this as request-for-comments because I would like to get
> feedback specifically on:

You still mention RFC here, but since it's removed from the subject, I'm
guessing you're not still looking for comments.

So, applied to v4.19/dt64 with Neil's tags.

Kevin
