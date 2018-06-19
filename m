From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 0/4] allwinner: a64: add SRAM controller
 / system control
Date: Tue, 19 Jun 2018 23:20:09 +0800
Message-ID: <CAGb2v65-X6X6C0sgCom2G3dBvn5iqD9aRfh84qSCv3jf8v-C0A@mail.gmail.com>
References: <20180614153548.9644-1-wens@csie.org> <20180615091413.pbdtrpa7txe6i4ee@flea>
 <CAGb2v64Ar+rOgiXbjtRrQojHUZteLa9N7OwM3XY7ZcpS87Qpmw@mail.gmail.com> <20180618073425.ce2dkipuvrtbqela@flea>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBP56UTMQKGQEL2X64TQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180618073425.ce2dkipuvrtbqela@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 3:34 PM, Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Mon, Jun 18, 2018 at 10:11:20AM +0800, Chen-Yu Tsai wrote:
>> On Fri, Jun 15, 2018 at 5:14 PM, Maxime Ripard
>> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>> > On Thu, Jun 14, 2018 at 11:35:44PM +0800, Chen-Yu Tsai wrote:
>> >> Hi,
>> >>
>> >> This series is the remaining A64 syscon changes from the R40 DWMAC
>> >> series. The series aligns how the A64 system control exports a regmap
>> >> for the sun8i DWMAC driver to access with what we've done for the R40.
>> >>
>> >> Originally the A64 used the generic syscon for this bit of hardware.
>> >> But this block also contains mapping bits for the onboard SRAM, used
>> >> by various peripherals, and other vendor specific bits we may use in
>> >> the future. It is by no means generic. And we already have a device
>> >> tree binding and driver for the SRAM part.
>> >>
>> >> The first patch make the SRAM control device export a regmap, exposing
>> >> a single EMAC control register, for the DWMAC driver to consume.
>> >>
>> >> The second and third patches rename the A64 compatible string to read
>> >> "system control", which is what the block is named in the user manual.
>> >>
>> >> The last patch fixes up the device node, and also adds the lone mappable
>> >> SRAM block, which is needed by the Display Engine.
>> >
>> > For the serie:
>> > Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>>
>> Cool. I'll apply them once you've rebased and pushed out any patches you
>> queued up during the merge window.
>
> All should be pushed now, feel free to apply them :)

Applied. Thanks.

ChenYu
