From: Greg Hackmann <ghackmann@google.com>
Subject: Re: [PATCH v2 1/1] platform: goldfish: pipe: add devicetree bindings
Date: Fri, 27 Nov 2015 10:17:44 -0800
Message-ID: <56589E48.9000708@google.com>
References: <1448481582-16991-1-git-send-email-jinqian@android.com>
 <20151125202416.GA4636@rob-hp-laptop> <20151126083412.GB14945@lvm>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151126083412.GB14945@lvm>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <christoffer.dall@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Jin Qian <jinqian@android.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Dan Carpenter <dan.carpenter@oracle.com>, Peter Senna Tschudin <peter.senna@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/26/15 12:34 AM, Christoffer Dall wrote:
> On Wed, Nov 25, 2015 at 02:24:16PM -0600, Rob Herring wrote:
>>
>> The binding may be trivial, but there's a bigger question of whether
>> this is the right long term direction. For example is upstream QEMU
>> going to take all the Android pipe stuff? Couldn't virtio be used here
>> as the transport?
>>
>
> But I wonder if that should really block this from being merged?  The
> support may not be in QEMU but it's in the Android emulator and it would
> be a less broken implementation with these patches in the kernel than
> without, I think.
>
> -Christoffer
>

To add to Christoffer's point, we added these bindings so we don't need 
to rely on the goldfish virtual bus for probing anymore.

Switching from the goldfish virtual bus to Device-Tree already 
eliminates one big piece where the Android emulator has diverged from 
upstream qemu.  And on the kernel side, it means we don't need ARM and 
MIPS goldfish board code to instantiate the bus.

In the long term I'm happy to push the SDK team towards replacing the 
Android pipe with a virtio alternative.  (We've already been switching 
over to virtio for things like storage.)  But in the short term, we 
still need it.  And I don't think it benefits the mainline kernel if we 
have to maintain cleanup patches like this out-of-tree.
