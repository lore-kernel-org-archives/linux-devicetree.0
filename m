From: Luis Araneda <luaraneda@gmail.com>
Subject: Re: [RFC PATCH 2/5] dt-bindings: xilinx: Add missing zynq boards
Date: Thu, 5 Jul 2018 17:10:48 -0400
Message-ID: <CAHbBuxrTSL0B-dC=gh_EOYAvk41mYJq6XsHEnWJi453Fq9Lu3Q@mail.gmail.com>
References: <20180628054205.17737-1-luaraneda@gmail.com> <20180628054205.17737-3-luaraneda@gmail.com>
 <20180703230410.GA31330@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703230410.GA31330@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviewing.

On Tue, Jul 3, 2018 at 7:04 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jun 28, 2018 at 01:42:02AM -0400, Luis Araneda wrote:
> > +- Adapteva Parallella board
> > +  "adapteva,parallella"
>
> This is documented in adapteva.txt, but I'd prefer if you put it
> here and remove adapteva.txt.

Ouch, I should have used git grep to find that.
I'll remove the adapteva.txt file on v2, which I'll be sending later today.

Thanks,

Luis Araneda.
