From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC/PATCH 0/3] Add devicetree scanning for randomness
Date: Wed, 12 Feb 2014 19:17:41 +0100
Message-ID: <1571508.yGAAZ8TNH0@wuerfel>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
 <201402121251.06280.arnd@arndb.de>
 <20140212174554.GM27395@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140212174554.GM27395@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Laura Abbott <lauraa@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, keescook@chromium.org
List-Id: devicetree@vger.kernel.org

On Wednesday 12 February 2014 12:45:54 Jason Cooper wrote:
> I brought this up at last weeks devicetree irc meeting.  My goal is to
> provide early randomness for kaslr on ARM.  Currently, my idea is modify
> the init script to save an additional random seed from /dev/urandom to
> /boot/random-seed.
> 
> The bootloader would then load this file into ram, and pass the
> address/size to the kernel either via dt, or commandline.  kaslr (run in
> the decompressor) would consume some of this randomness, and then
> random.c would consume the rest in a non-crediting initialization.

I like the idea, but wouldn't it be easier to pass actual random data
using DT, rather than the address/size? That way we could even
use the same DT binding for passing randomness from the bootloader,
whereever it may have found that.

If the bootloader has internet connectivity, it could even mix in
some data from http://www.random.org/cgi-bin/randbyte?nbytes=256&format=f
;-)

	Arnd
