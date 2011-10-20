From: Timur Tabi <timur@freescale.com>
Subject: Re: [RFC][PATCH 1/2] powerpc/85xx: create dts components to build
 up an SoC
Date: Thu, 20 Oct 2011 16:05:36 -0500
Message-ID: <4EA08D20.7010405@freescale.com>
References: <1319095467-6229-1-git-send-email-galak@kernel.crashing.org>
 <CAOZdJXWtnBB5=DahG8LGQpeP7or0VZv78duhtPiORk3WOir8gQ@mail.gmail.com>
 <A54F7698-A96F-4EE1-89DB-B6A7C5A071FB@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <A54F7698-A96F-4EE1-89DB-B6A7C5A071FB@kernel.crashing.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Kumar Gala wrote:
>> > How about we put all serial devices into one pq3-duart.dtsi file, and
>> > let the parent dtsi file reference just the ones that it needs?
> there isn't an option to do that w/dtc

What about making all the nodes disabled by default, and then the soc.dtsi
or si.dtsi file can re-enable them?

-- 
Timur Tabi
Linux kernel developer at Freescale
