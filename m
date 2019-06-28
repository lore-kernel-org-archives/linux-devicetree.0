From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RESEND PATCH 05/10] crypto: sha256_generic: Export the
 Transform function
Date: Thu, 27 Jun 2019 22:09:44 -0700
Message-ID: <20190628050944.GE673@sol.localdomain>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-6-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190628042745.28455-6-j-keerthy@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Keerthy <j-keerthy@ti.com>
Cc: nm@ti.com, devicetree@vger.kernel.org, herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org, t-kristo@ti.com, robh+dt@kernel.org, linux-crypto@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 09:57:40AM +0530, Keerthy wrote:
> The transform function can be used as is by other crypto
> drivers that need to transform the 256 bit key using cpu.
> Hence export it.

What is this supposed to mean?  SHA-256 is an unkeyed hash function.

Also, you need to actually explain why this is needed.  If your hardware
supports SHA-256, why do you need to use the C sha256_transform()?

- Eric
