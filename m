From: Jonas Bonn <jonas@southpole.se>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Fri, 15 Nov 2013 11:57:33 +0100
Message-ID: <5285FE1D.3020800@southpole.se>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
	<CAMuHMdWA-9ax=NG_d0tyfzY3+42Ka7_r+jTeF-m5oW0eV8t1=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <CAMuHMdWA-9ax=NG_d0tyfzY3+42Ka7_r+jTeF-m5oW0eV8t1=g@mail.gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Mehall <contact@kevinmehall.net>, linux@lists.openrisc.net
List-Id: devicetree@vger.kernel.org

On 11/15/2013 11:22 AM, Geert Uytterhoeven wrote:
>> This should probably be "altera,de0_nano".  We also need to put a version
>
> "terasic,de0_nano"? The board says "Designed and manufactured by Terasic".
> Hmm, the sticker on the box says "Altera DE0-Nano".

Good question...

>>
>> Version number needed.  OpenCores wanted "projectname-rtlsvn###" where ###
>> is the SVN commit number of the RTL directory in the project's source
>> repository.
>
> That's gonna need some information diving, as Stefan's orpsoc git repositories
> only contains references to orpsocv2 git-svn-ids, not the svn ids of
> the original
> component repositories.

Stefan?  Where's the "official" home of these cores nowadays?  Have they 
been modified since they were copied from OpenCores into orpsocv2?

>> Like I mentioned earlier, I'd like to see this thing disappear altogether
>> and be replaced with gpio-generic.
>
> That needs device-tree support and published bindings first. IIRC, you
> had some preliminary code?

I thought I did, but I was mistaken.  I don't have anything for 
gpio-generic.

/Jonas
