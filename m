From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] checks: add a string checks for label, bootargs and stdout-path
Date: Mon, 20 Nov 2017 11:26:49 -0600
Message-ID: <CAL_JsqJUpgBC1awgTZgz3pwhYUL02ES=E-ogqVONxDFjg8eSag@mail.gmail.com>
References: <20171117144515.10870-1-robh@kernel.org> <20171117144515.10870-2-robh@kernel.org>
 <20171120000954.GF19214@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120000954.GF19214-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 19, 2017 at 6:09 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Nov 17, 2017 at 08:45:11AM -0600, Rob Herring wrote:
>> Add more string property checks for label, bootargs, and stdout-path.
>
> Where does 'label' appear?  I'm not immediately recalling it as a
> property with global meaning.

It's documented in DT spec/ePAPR. It can be anywhere. It's the
property for the human readable identifiers such as the label on
ethernet ports, serial ports, LEDs, etc.

> bootargs and stdout-path are from /chosen of course.  I have some
> mixed feelings about whether it's reasonable to check it's a string
> everywhere, rather than specifically just in /chosen.

We don't really want to see the same property names with different
meanings. I think checking the location is a separate check. You've
generally suggested splitting up tests rather than have all in one
tests. Not sure if we should check known properties only appear in
chosen or that chosen only has known properties (assuming we can
enumerate that list. Maybe we allow things like "linux,*").

Rob
