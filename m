From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/3] dtc updates for 4.12
Date: Tue, 21 Mar 2017 12:15:46 -0700
Message-ID: <CAOesGMiWFPERPapOLCW4iqSuFWiqesBBjGN0ny6XjzFXNfKr4g@mail.gmail.com>
References: <20170321161958.9658-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170321161958.9658-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "arm@kernel.org" <arm@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 9:19 AM, Rob Herring <robh@kernel.org> wrote:
> This series syncs dtc with current mainline. The primary motivation is
> to pull in the new checks I've worked on. This gives lots of new
> warnings which are turned off by default.
>
> Arm-soc folks, I've left the PCI checks enabled as they are pretty much
> all real errors and there aren't that many (about 1200, but that's lots
> of duplicates). I have a patch for some of them.

Yay for better warnings!

But as with all changes of this kind, when new warnings are introduced
please give people some time to remove them without turning them on by
default. We had a cycle like that already.

Main reason is that it becomes too hard to spot new warnings when they
come in if the logs are flooded with 1200 existing warnings.

How many of them do you have patches for, per chance? If we can see
them show up quickly the answer to the above might be a bit different.


-Olof
