From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Date: Fri, 20 Sep 2019 18:23:00 +0200
Message-ID: <CAJKOXPcsSjVoHmCJN_AF8a2gkVN3+kQh4D+J01GnxGmMOZh4Hg@mail.gmail.com>
References: <20190920162124.7036-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 20 Sep 2019 at 18:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> using json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Remove unneeded timeout-sec description and include generic bindings.

My bad, this is actually v3.

Best regards,
Krzysztof
