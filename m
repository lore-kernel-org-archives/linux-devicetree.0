From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 02/11] x86: Add device tree support
Date: Thu, 30 Dec 2010 13:58:09 -0700
Message-ID: <AANLkTinSr_KYkFNUmWbL2PUzS2Ose7cA5q8xUbLeUr=J@mail.gmail.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-3-git-send-email-bigeasy@linutronix.de>
	<1290807736.32570.143.camel@pasglop>
	<20101128134907.GA30784@www.tglx.de>
	<20101230082654.GB11721@angua.secretlab.ca>
	<AANLkTin2=T=v0ZNOpAGhwuM0i9Ts8Xr+kRtEJ95VGeOp@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTin2=T=v0ZNOpAGhwuM0i9Ts8Xr+kRtEJ95VGeOp-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 30, 2010 at 1:45 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
> On Thu, Dec 30, 2010 at 2:26 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>> What is the boot sequence for the embedded x86 platforms? =A0Is there
>> still a bootloader?
>
> There's no one embedded setup on any platform, but one of the few
> constants of embedded development is trying to eliminate unnecessary
> requirements.
>
> Just on standard-ish PC hardware I've seen people try to stick Linux in t=
he
> BIOS flash (generally not enough room), I've seen people try to stick
> it as the first stage PXE payload, there's the fun and games with
> kexec of emergency kernels for crash dumps...
>
> If the capability to skip an unnecessary bootloader was available, people
> would use it.

Right, but in all of those cases a boot wrapper provides the same
functionality with better flexability, such as being able to provided
the dtb image(s) at install time instead of compile time.

g.
