From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [Question] orphan platform data header
Date: Mon, 22 Jul 2019 08:46:16 +0200
Message-ID: <21af683a-a188-7aa9-9c82-98c02b8717f8@metux.net>
References: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
 <CAK8P3a2AeUpmNfFLJSvHT=AJ0kFRT2B=TWDm0HsTwoHt2jQ0gQ@mail.gmail.com>
 <CAK7LNATPbCjwzVnAigsQ8tQRXjC31uxgPg3jgi7pwp+N1RPgWw@mail.gmail.com>
 <CAK8P3a3cURmbGZc-6ESLjrF465VLnBroD4QENyfsSsCrNenRrA@mail.gmail.com>
 <CAK7LNARN=iNmresDJ2=J1wOb2QYoZ7yw4O0Q9sYVPo0jRKDf=w@mail.gmail.com>
 <CAK8P3a133ekPqkLWfC2ee0mT3iLbFzSjJ9FDokSyaX+hMVigKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a133ekPqkLWfC2ee0mT3iLbFzSjJ9FDokSyaX+hMVigKA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 21.07.19 16:15, Arnd Bergmann wrote:

> That is different: the hardware attaches to a serial port and may well
> be usable, and the user space side just contains a copy of the header,
> see https://github.com/nwdigitalradio/ax25-tools/tree/master/yamdrv

I believe that such header copies in userland applications are
conceptionally wrong. Whenever something changes, both sides need
to be kept in sync.

Maybe we should talk to the hamradio folks to get this cleaned up.
IMHO, this header should go to uapi.

> It seems more useful to keep looking for drivers with a platform_data
> header file that is no longer included by any platform for candidates
> that may be obsolete.

Some folks see platform_data old legacy that should be removed, but I
don't aggree. For example w/ apu2 board driver (and corresponding
amd-fch-gpio driver) I even had to introduce a pdata struct, so the
board driver could configure the gpio driver. Certainly, I would have
preferred doing everything via DT, but that's not available on x86/acpi
targets (if anybody knows a way to inject a DT snippet just for one
driver in such a scenario, please let me know).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
