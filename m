From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 15/41] Documentation: dt: mfd: fix spelling mistakes
Date: Tue, 26 Apr 2016 08:35:49 -0500
Message-ID: <CAL_JsqLn7cZqqWzOT97QPaMyiPsTJRsp=_oNRDAjWtPo5fvngw@mail.gmail.com>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-16-git-send-email-eric@engestrom.ch> <20160425135017.GA8656@rob-hp-laptop>
 <20160425165830.GP2713@dell> <CAL_JsqJC1epdP_RBm4fSz2ouYPy40NuFzfj6M1qB0rxV7H4S=Q@mail.gmail.com>
 <20160426063516.GQ2713@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160426063516.GQ2713@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Eric Engestrom <eric@engestrom.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 26, 2016 at 1:35 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 25 Apr 2016, Rob Herring wrote:
>
>> On Mon, Apr 25, 2016 at 11:58 AM, Lee Jones <lee.jones@linaro.org> wrote:
>> > On Mon, 25 Apr 2016, Rob Herring wrote:
>> >
>> >> On Mon, Apr 25, 2016 at 01:24:12AM +0100, Eric Engestrom wrote:
>> >> > Signed-off-by: Eric Engestrom <eric@engestrom.ch>
>> >>
>> >> Applied, thanks.
>> >
>> > I'd prefer to continue taking these if you don't mind Rob.  It'd limit
>> > on the amount of immutable branch pull requests I have to send/handle.
>>
>> Why? Do you really expect to have a dependency here?
>
> Because the file is in ".*/mfd/.*", which normally goes through the MFD
> tree.
>
> $ git log --committer="Rob Herring" --oneline -- Documentation/devicetree/bindings/mfd/ | wc -l
> 6
> $ git log --committer="Lee Jones" --oneline -- Documentation/devicetree/bindings/mfd/ | wc -l
> 99

That is because most changes are coupled with drivers. For changes
that are standalone without any dependency, they go thru my tree. If
we're getting any merge conflicts beyond which Linus can/wants to fix,
then there is a problem because bindings shouldn't be changing that
much.

Eventually, I think we need to merge all the bindings thru a single
tree. Otherwise, we'll never move toward moving bindings out of the
kernel (unless we just sync from the kernel tree to a standalone
repo).

Rob
