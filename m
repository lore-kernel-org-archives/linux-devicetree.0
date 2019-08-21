From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v8 2/3] fdt: add support for rng-seed
Date: Wed, 21 Aug 2019 12:21:26 -0400
Message-ID: <20190821162126.GA2713@mit.edu>
References: <20190819071602.139014-1-hsinyi@chromium.org>
 <20190819071602.139014-3-hsinyi@chromium.org>
 <20190819181349.GE10349@mit.edu>
 <CAJMQK-ghQ8weMerXW7t0DFZTAg_c5M80Yp5DTAtyY2LA7YpS1A@mail.gmail.com>
 <CAKv+Gu_qJUU2hRujjv6e5yPqPQXRXokBU_2mSGD3civ2d2+xhw@mail.gmail.com>
 <CAJMQK-hdYz+pW5QL41nXkZAX1qiRynaWg7cne48qCaQsuPrSCg@mail.gmail.com>
 <CAKv+Gu-kp-LqCCx=h2TJxzns4KpM-UEjz3md0u3hbVOyp+iFtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-kp-LqCCx=h2TJxzns4KpM-UEjz3md0u3hbVOyp+iFtA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <swboyd@chromium.org>, Will Deacon <will.deacon@arm.com>, lkml <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Andrew Murray <andrew.murray@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 09:39:28AM +0300, Ard Biesheuvel wrote:
> 
> Whether to trust the firmware provided entropy is a policy decision,
> and typically, we try to avoid dictating policy in the kernel, and
> instead, we try to provide a sane default but give the user control
> over it.
> 
> So in this case, we should probably introduce
> add_firmware_randomness() with a Kconfig/cmdline option pair to decide
> whether it should be trusted or not (or reuse the one we have for
> trusting RDRAND etc)

I'd call it add_bootloader_randomness(), since we are trusting the
*bootloader*; it's the bootloader which is vouching for the security /
validity of the passed-in entropy.  Furthermore, the bootloader on
some architectures might be fetching directly from some secure
element.

And for that reason, I'd use a different Kconfig/cmdline option pair
than the one used for trusting CPU-provided randomness.

						- Ted
