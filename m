From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v12 4/4] Watchdog: introduce ARM SBSA watchdog driver
Date: Tue, 16 Feb 2016 16:09:38 -0800
Message-ID: <20160217000938.GA19355@roeck-us.net>
References: <1455611785-2407-1-git-send-email-fu.wei@linaro.org>
 <1455611785-2407-5-git-send-email-fu.wei@linaro.org>
 <56C34076.1020206@roeck-us.net>
 <CADyBb7vDuZjjy92WkV_jML2Ji13LvtuqkKszAetzvoM47CaY7Q@mail.gmail.com>
 <CADyBb7s0mf9MLxXeR54wBCPnTBSC7hiNw08C-5vc9EhkORGZww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADyBb7s0mf9MLxXeR54wBCPnTBSC7hiNw08C-5vc9EhkORGZww@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Fu Wei <fu.wei@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Wim Van Sebroeck <wim@iguana.be>, Jon Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linaro ACPI Mailman List <linaro-acpi@lists.linaro.org>, Richard Ruigrok <rruigrok@codeaurora.org>, "Abdulhamid, Harb" <harba@codeaurora.org>, Christopher Covington <cov@codeaurora.org>, Timur Tabi <timur@codeaurora.org>, Dave Young <dyoung@redhat.com>, Pratyush Anand <panand@redhat.com>, G Gregory <graeme.gregory@li>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 12:33:24AM +0800, Fu Wei wrote:
[ ... ]
> >>> +MODULE_AUTHOR("Fu Wei <fu.wei@linaro.org>");
> >>> +MODULE_AUTHOR("Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>");
> >>> +MODULE_AUTHOR("Al Stone <al.stone@linaro.org>");
> >>> +MODULE_AUTHOR("Timur Tabi <timur@codeaurora.org>");
> >>> +MODULE_LICENSE("GPL v2");
> >>>
> >> Do you need a MODULE_ALIAS ?
> >
> > For now, I thinks we don't need it, Hope I didn't miss something :-)
> > Because this module can be mounted automatically with dtb or ACPI(if
> > apply my GTDT patch).
> > Do you have any suggestion or concern? :-)
> 
> re-think  about that , will add
> MODULE_ALIAS("platform:sbsa-gwdt");
> 
> Do you agree ?  :-)
> 
Sure.

Guenter
