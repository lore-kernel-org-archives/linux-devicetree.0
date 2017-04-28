From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 28 (of/unittest)
Date: Fri, 28 Apr 2017 09:44:37 -0700
Message-ID: <3baa63fd-8a55-9a05-a2ac-91ba0563d1e5@infradead.org>
References: <20170428171121.4a21b861@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20170428171121.4a21b861@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/28/17 00:11, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170427:
> 

on i386:

when CONFIG_OF_OVERLAY is not enabled:

drivers/built-in.o: In function `unflatten_device_tree':
(.init.text+0x1209f): undefined reference to `unittest_unflatten_overlay_base'


-- 
~Randy
