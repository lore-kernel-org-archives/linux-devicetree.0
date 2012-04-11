From: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: standalone dtc compiler build from
 git://git.jdl.com/software/dtc.git  gives error
Date: Wed, 11 Apr 2012 17:59:07 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7300643@DFLE34.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Jon Lolieger,

I have tried using the standalone dtc compiler at git://git.jdl.com/software/dtc.git to compile my dts file and got the following error:-

a0868495@ares-ubuntu:~/dtc$ dtc -I dts -O dtb tci6614-evm.dts
DTC: dts->dtb  on file "tci6614-evm.dts"
tci6614-evm.dts:4 syntax error

The dtc in the linux tree (Linux version 3.2) is able to compile the dts file and I am able to boot kernel using the dtb. I am using v1.3.0 tag of the dtc git repo. Comparing the files with that under scripts/dtc in the kernel tree, I find they are different. Why is the dtc not able to compile the dts file? How is the dtc tree synced with the Linux kernel tree? As a user, how do I know what version of dtc I need to use for a given kernel release? Any help here?


Murali Karicheri
Software Design Engineer
