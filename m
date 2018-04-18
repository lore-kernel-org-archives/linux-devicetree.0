From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: da850-lcdk: add unit name for memory node
Date: Wed, 18 Apr 2018 10:20:26 -0500
Message-ID: <4843ee2b-bd62-a557-8d63-4a77374bcb2d@lechnology.com>
References: <20180418092408.2077-1-nsekhar@ti.com>
 <20180418092408.2077-3-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180418092408.2077-3-nsekhar@ti.com>
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
To: Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/18/2018 04:24 AM, Sekhar Nori wrote:
> Add unit name for memory node to squash the W=1 warning:
> 
> arch/arm/boot/dts/da850-lcdk.dtb: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
> 
> While at it, drop the device_type property from memory
> node since its provided by da850.dtsi already.
> 
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
