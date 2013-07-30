From: Daniel Mack <zonque@gmail.com>
Subject: Re: [RFC PATCH 0/2] impedance-matcher generic improvements
Date: Tue, 30 Jul 2013 09:48:51 +0200
Message-ID: <51F76FE3.1080302@gmail.com>
References: <51F2A014.7000209@gmail.com>
 <cover.1375131816.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1375131816.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>
List-Id: devicetree@vger.kernel.org

Hi Jason,

On 29.07.2013 23:23, Jason Cooper wrote:
> Basic idea is to replace a device's stock kernel with this impedance-matcher.
> Load the kernel and/or the devicetree blob to desired addresses.  Add
> 'loadaddrs=0xXXXXXXXX,0xYYYYYYYY' to the kernel's command line.  Or, if you are
> appending, 'loadaddrs=appended,0xYYYYYYYY'.  First address is the location of
> the kernel, second is the location of the dtb.

Nice to see that idea implemented! For me though, changing any of the
U-Boot variables is out of the question, and I need the matcher just the
way I implemented it, including the LED blink pattern to let the user
know if things go wrong.

Hence, I won't change to your generic version on my boards, and so I
think it might be best if you maintain your own tree for your approach.


Best regards,
Daniel
