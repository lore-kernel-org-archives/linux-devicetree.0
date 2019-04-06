From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: fix YAML whitespace in cpus.yaml
Date: Sat, 6 Apr 2019 01:53:14 -0500
Message-ID: <CABGGisyGzP0nOoGms7YxXaNKaJ7Ho2KtohMp=nc0D5Z9A3TdDA@mail.gmail.com>
References: <20190406062538.31325-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190406062538.31325-1-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Arnd Bergmann <arnd@arndb.de>, Sugaya Taichi <sugaya.taichi@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 6, 2019 at 1:26 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Running 'make dt_binding_check' fails for
> Documentation/devicetree/bindings/arm/cpus.yaml.  This is due to tabs
> used for indentation:

You're the 3rd fix. :( We're waiting on arm-soc folks to apply it.

Rob
