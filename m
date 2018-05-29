From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 1/8] driver core: make deferring probe after init
 optional
Date: Mon, 28 May 2018 22:12:14 -0700
Message-ID: <1765be22-4bd7-c870-926c-2956e46df1d9@gmail.com>
References: <20180524175024.19874-1-robh@kernel.org>
 <20180524175024.19874-2-robh@kernel.org>
 <20180524181834.GF4828@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180524181834.GF4828@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Alexander Graf <agraf@suse.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, boot-architecture@lists.linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/24/18 11:18, Mark Brown wrote:
> On Thu, May 24, 2018 at 12:50:17PM -0500, Rob Herring wrote:
> 
>> Subsystems or drivers may opt-in to this behavior by calling
>> driver_deferred_probe_check_init_done() instead of just returning
>> -EPROBE_DEFER. They may use additional information from DT or kernel's
>> config to decide whether to continue to defer probe or not.
> 
> Should userspace have some involvement in this decision?  It knows if
> it's got any intention of loading modules for example.  Kernel config
> checks might be good enough, though it's going to be a pain to work out
> if the relevant driver is built as a module for example.
> 

A parallel issue is that loading an overlay could provide the resource
that will allow the deferred probe to complete.  (That is, once we
finish implementing the run time overlays feature.)

-Frank
