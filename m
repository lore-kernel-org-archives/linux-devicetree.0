From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V5 00/23] Generic BMIPS kernel
Date: Mon, 15 Dec 2014 10:58:57 +0100
Message-ID: <3160456.oe6LURFJHs@wuerfel>
References: <1418422034-17099-1-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418422034-17099-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 12 December 2014 14:06:51 Kevin Cernekee wrote:
> V4->V5:
> 
>  - Rebase on top of Linus' head of tree, converting BCM3384 platform code
>    to Generic BMIPS platform code.
> 
>  - Fix a couple of #include's
> 
>  - Remove a couple of bogus entries from bmips_be_defconfig
> 
> Compile-tested only.  Some BMIPS platforms may require acked-but-unmerged
> changes in other subsystems (like the native-endian serial8250/DT patches).
> 
> For 3.19 you'll want the first patch at the minimum (because the build is
> currently broken).
> 

Since I commented on some of these patches before, I now took another
(not very thorough) look at all of them. Looks very nice overall, I
have no further comments.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
